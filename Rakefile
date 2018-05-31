require "bundler/gem_tasks"
require "rake/testtask"

require "rake/extensiontask"
Rake::ExtensionTask.new("csv") do |ext|
  ext.lib_dir = "lib/csv"
end

Rake::TestTask.new(:test) do |t|
  t.libs << "test" << "test/lib"
  t.libs << "lib"
  t.test_files = FileList['test/**/test_*.rb']
end

task :default => :test
