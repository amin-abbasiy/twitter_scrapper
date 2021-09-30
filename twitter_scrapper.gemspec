require_relative "lib/twitter_scrapper/version"

Gem::Specification.new do |spec|
  spec.name          = "twitter_scrapper"
  spec.version       = TwitterScrapper::VERSION
  spec.authors       = ["a.abbasi"]
  spec.email         = ["a.abbasi@roundtableapps.com"]

  spec.summary       = "scrape specific data from twitter"
  spec.description   = "when you need scrape data from twitter use this lib"
  spec.homepage      = "https://github.com/amin-abbasiy"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "https://rubydoc.info'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/amin-abbasiy/twitter_scrapper/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'twitter', '~> 7.0'
end
