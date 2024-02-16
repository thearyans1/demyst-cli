# frozen_string_literal: true

module Demyst
  module Output
    class Yaml
      def self.call(data)
        puts data.to_yaml
      end
    end
  end
end
