# frozen_string_literal: true

require_relative "lib/recipe_app/version"

Gem::Specification.new do |spec|
  spec.name          = "recipe_app"
  spec.version       = RecipeApp::VERSION
  spec.authors       = ["vincci cheng"]
  spec.email         = ["vincci.cheng.9@gmail.com"]

  spec.summary       = "Hello World"
  spec.description   = "Recipe Gem App"
  spec.homepage      = "https://github.com/vincci-cheng-project-development-page/ruby-recipe-cli"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.1")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/vincci-cheng-project-development-page/ruby-recipe-cli"
  spec.metadata["changelog_uri"] = "https://github.com/vincci-cheng-project-development-page/ruby-recipe-cli/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  # spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "bin"]
  # Uncomment to register a new dependency of your gem
  spec.add_dependency "open-uri"
  spec.add_dependency "nokogiri"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
