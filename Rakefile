# -*- ruby -*-

require "rubygems"
require "hoe"
require "standard/rake"

Hoe.plugin :doofus
Hoe.plugin :gemspec2
# Hoe.plugin :cov
# Hoe.plugin :rdoc

Hoe.spec "adam12-authentication" do
  developer "Adam Daniels", "adam@mediadrive.ca"
  license "MIT"

  dependency "minitest", "~> 5.17", :dev
  dependency "hoe-doofus", "~> 1.0", :dev
  dependency "hoe-gemspec2", "~> 1.1", :dev
  dependency "standard", "~> 1.22.1", :dev

  dependency "sequel", "~> 5.64", :dev
  dependency "sqlite3", "~> 1.6", :dev
end

task default: [:test, "standard:fix"]

# vim: syntax=ruby
