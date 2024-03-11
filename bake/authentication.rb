# Generate migration
# @param path [String] Destination path for migration file
def migration(path)
  if File.exist?(path)
    abort "Destination path already exists"
  end

  require "fileutils"

  template = File.expand_path("../template/migration.rb", __dir__)
  FileUtils::Verbose.cp(template, path)
end
