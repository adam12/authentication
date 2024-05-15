# frozen-string-literal: true

require_relative "lib/authentication/version"

Gem::Specification.new do |s|
  s.name = "adam12-authentication"
  s.version = Authentication::VERSION
  s.authors = "Adam Daniels"
  s.email = "adam@mediadrive.ca"
  s.summary = "An API-first authentication library, with some functionality mirroring the Rodauth project."
  s.description = "An API-first authentication library, with some functionality\nmirroring the Rodauth project."
  s.homepage = "https://github.com/adam12/authentication"
  s.license = "MIT"

  s.add_development_dependency "minitest", "~> 5.17"
  s.add_development_dependency "standard", "~> 1.22.1"
  s.add_development_dependency "sequel", "~> 5.64"
  s.add_development_dependency "sqlite3", "~> 1.6"
  s.add_development_dependency "bcrypt", "~> 3.1"
  s.add_development_dependency "rdoc", ">= 4.0", "< 7"
  s.add_development_dependency "covered", "~> 0.25"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- test/*`.split("\n")
end
