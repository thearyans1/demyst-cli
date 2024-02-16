# frozen_string_literal: true

module Demyst
  module Actions
    class Todo
      OUTPUT_FORMATTERS = {
        'json' => Demyst::Output::Json,
        'yaml' => Demyst::Output::Yaml,
        'plain' => Demyst::Output::Plain
      }.freeze

      BASE_URL = 'https://jsonplaceholder.typicode.com/todos/%d'
      DEFAULT_VALUE_TO_FETCH = 20

      private_class_method :new

      def self.call(values)
        values => {total:, output:}
        new(total, output).call
      end

      def call
        todos = todos_from_api
        @formatter.call(todos)
      end

      private

      def initialize(total, output)
        @total = total || DEFAULT_VALUE_TO_FETCH
        @formatter = OUTPUT_FORMATTERS[output] || OUTPUT_FORMATTERS['plain']
      end

      def todos_from_api
        urls = (1..@total).map { |value| format(BASE_URL, value * 2) }

        Client.call(urls).map do |response|
          response.slice('title', 'completed')
        end
      end
    end
  end
end
