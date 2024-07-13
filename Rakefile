require "bundler/setup"
require "standard/rake"
require "bundler/gem_tasks"
require "rdoc/task"
require "minitest/test_task"

RDoc::Task.new do |rdoc|
  rdoc.main = "README.md"
  rdoc.rdoc_files.include("README.md", "lib/**/*.rb")
  rdoc.markup = :markdown
end

Minitest::TestTask.create

task default: [:test, "standard:fix"]

# vim: syntax=ruby
