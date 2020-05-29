require_relative 'lib/eshop/version'

Gem::Specification.new do |spec|
  spec.name          = "eshop"
  spec.version       = Eshop::VERSION
  spec.authors       = ["Dmitry Dubenets"]
  spec.email         = ["xaircore@gmail.com"]

  spec.summary       = "Nintendo eShop client"
  spec.description   = "Nintendo eShop client"
  spec.homepage      = "https://github.com/xaircore/eshop"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.extra_rdoc_files = ["README"]

  spec.add_dependency "iri", "~> 0.5"
  spec.add_dependency "faraday", "~> 1.0"

  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
