# frozen_string_literal: true

module Demyst
  class Cli < Thor
    package_name 'Demyst Cli'

    desc '[OPTIONS]', 'list todos, by their name and id'
    method_option 'total', type: :numeric, default: 20, aliases: '-n', banner: 'no of todos to pull'
    method_option 'output', type: :string, default: 'plain', aliases: '-o', enum: %w[json yaml plain],
                            banner: 'the format for output'
    def todo
      Actions::Todo.call(**options)
    end
  end
end
