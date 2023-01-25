# -*- ruby -*-

require "rubygems"
require "hoe"
require "minitest/test_task"

Minitest::TestTask.create

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
end

# vim: syntax=ruby
