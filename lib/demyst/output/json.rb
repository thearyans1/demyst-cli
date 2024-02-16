# frozen_string_literal: true

module Demyst
  module Output
    class Json
      def self.call(data)
        puts JSON.pretty_generate(data)
      end
    end
  end
end
