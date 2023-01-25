# -*- encoding: utf-8 -*-
# stub: adam12-authentication 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "adam12-authentication".freeze
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/adam12/authentication/issues", "homepage_uri" => "https://github.com/adam12/authentication", "source_code_uri" => "https://github.com/adam12/authentication" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Adam Daniels".freeze]
  s.date = "2023-01-25"
  s.description = "FIX (describe your package)".freeze
  s.email = ["adam@mediadrive.ca".freeze]
  s.extra_rdoc_files = ["History.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze]
  s.files = [".autotest".freeze, "History.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze, "Rakefile".freeze, "lib/authentication.rb".freeze]
  s.homepage = "https://github.com/adam12/authentication".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.txt".freeze]
  s.rubygems_version = "3.3.7".freeze
  s.summary = "FIX (describe your package)".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<minitest>.freeze, ["~> 5.17"])
    s.add_development_dependency(%q<hoe-doofus>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<hoe-gemspec2>.freeze, ["~> 1.1"])
    s.add_development_dependency(%q<sequel>.freeze, ["~> 5.64"])
    s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.6"])
    s.add_development_dependency(%q<rdoc>.freeze, [">= 4.0", "< 7"])
    s.add_development_dependency(%q<hoe>.freeze, ["~> 4.0"])
  else
    s.add_dependency(%q<minitest>.freeze, ["~> 5.17"])
    s.add_dependency(%q<hoe-doofus>.freeze, ["~> 1.0"])
    s.add_dependency(%q<hoe-gemspec2>.freeze, ["~> 1.1"])
    s.add_dependency(%q<sequel>.freeze, ["~> 5.64"])
    s.add_dependency(%q<sqlite3>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rdoc>.freeze, [">= 4.0", "< 7"])
    s.add_dependency(%q<hoe>.freeze, ["~> 4.0"])
  end
end
