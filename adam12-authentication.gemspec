# -*- encoding: utf-8 -*-
# stub: adam12-authentication 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "adam12-authentication".freeze
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/adam12/authentication/issues", "homepage_uri" => "https://github.com/adam12/authentication", "source_code_uri" => "https://github.com/adam12/authentication" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Adam Daniels".freeze]
  s.date = "2023-12-13"
  s.description = "An API-first authentication library, with some functionality\nmirroring the Rodauth project.".freeze
  s.email = ["adam@mediadrive.ca".freeze]
  s.extra_rdoc_files = ["History.rdoc".freeze, "Manifest.txt".freeze, "README.rdoc".freeze]
  s.files = ["History.rdoc".freeze, "Manifest.txt".freeze, "README.rdoc".freeze, "Rakefile".freeze, "lib/authentication.rb".freeze, "lib/authentication/configurable.rb".freeze, "lib/authentication/plugins.rb".freeze, "lib/authentication/plugins/account_base.rb".freeze, "lib/authentication/plugins/bcrypt.rb".freeze, "lib/authentication/plugins/change_password.rb".freeze, "lib/authentication/plugins/core.rb".freeze, "lib/authentication/plugins/create_account.rb".freeze, "lib/authentication/plugins/instrumenter.rb".freeze, "lib/authentication/plugins/reset_password.rb".freeze, "lib/authentication/plugins/session_base.rb".freeze, "lib/authentication/plugins/sign_in.rb".freeze, "lib/authentication/plugins/sign_out.rb".freeze, "lib/authentication/version.rb".freeze]
  s.homepage = "https://github.com/adam12/authentication".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze]
  s.rubygems_version = "3.4.10".freeze
  s.summary = "An API-first authentication library, with some functionality mirroring the Rodauth project.".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<dry-configurable>.freeze, ["~> 1.0"])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.17"])
  s.add_development_dependency(%q<minitest-autotest>.freeze, ["~> 1.1"])
  s.add_development_dependency(%q<hoe-doofus>.freeze, ["~> 1.0"])
  s.add_development_dependency(%q<hoe-gemspec2>.freeze, ["~> 1.1"])
  s.add_development_dependency(%q<standard>.freeze, ["~> 1.22.1"])
  s.add_development_dependency(%q<sequel>.freeze, ["~> 5.64"])
  s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.6"])
  s.add_development_dependency(%q<bcrypt>.freeze, ["~> 3.1"])
  s.add_development_dependency(%q<rdoc>.freeze, [">= 4.0", "< 7"])
  s.add_development_dependency(%q<hoe>.freeze, ["~> 4.1"])
end
