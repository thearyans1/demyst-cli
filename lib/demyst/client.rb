# frozen_string_literal: true

module Demyst
  class Client
    private_class_method :new

    def self.call(urls)
      new(urls).call
    end

    def call
      responses = []
      Async do
        responses = @urls.map do |url|
          Async { client.get(url) }
        end.map(&:wait)
      ensure
        Faraday.default_connection.close
      end
      responses.select { |response| response.status == 200 }.map(&:body)
    end

    def initialize(urls)
      @urls = urls
    end

    private

    def client
      @client ||= Faraday.new do |conn|
        conn.response :json
        conn.adapter :async_http
      end
    end
  end
end
