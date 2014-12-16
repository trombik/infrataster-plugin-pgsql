# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "infrataster-plugin-pgsql"
  spec.version       = '0.1.1'
  spec.authors       = ["Sneha More"]
  spec.email         = ["snehamore204@gmail.com"]
  spec.summary       = %q{PgSQL plugin for Infrataster}
  spec.homepage      = ""
  spec.license	     = "MIT"
  spec.files         = `find . -type f`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "infrataster", "~> 0.2.0"
  spec.add_runtime_dependency "pg", "~> 0.17"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
end
