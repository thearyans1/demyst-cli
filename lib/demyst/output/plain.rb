# frozen_string_literal: true

module Demyst
  module Output
    class Plain
      def self.call(data)
        case data
        when Hash
          data.each { |k, v| puts "#{k}: #{v} \n" }
        when Array
          data.each { |element| call(element) }
        else
          puts data
        end
      end
    end
  end
end
