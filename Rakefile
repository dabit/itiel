require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'cucumber/rake/task'

task :default => [:spec, :cucumber]

RSpec::Core::RakeTask.new

Cucumber::Rake::Task.new do |task|
  task.cucumber_opts = %w{--format progress}
end
