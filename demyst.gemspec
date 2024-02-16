# frozen_string_literal: true

require_relative 'lib/demyst/version'

Gem::Specification.new do |spec|
  spec.name = 'demyst'
  spec.version = Demyst::VERSION
  spec.authors = ['The Aryans']
  spec.email = ['thearyans1@gmail.com']

  spec.summary = 'Write a short summary, because RubyGems requires one.'
  spec.description = 'Write a longer description or delete this line.'
  spec.homepage = 'https://themonk.me'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1'

  spec.metadata['allowed_push_host'] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://not-available.yet'
  spec.metadata['changelog_uri'] = 'https://not-available.yet'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'async-http-faraday'
  spec.add_dependency 'faraday'
  spec.add_dependency 'thor'

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'webmock'
end
