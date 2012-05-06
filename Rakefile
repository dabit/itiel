require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'
require 'cucumber/rake/task'

task :default => [:test, :cucumber]

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

Cucumber::Rake::Task.new do |task|
  task.cucumber_opts = %w{--format progress}
end
