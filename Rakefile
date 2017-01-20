require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :docker do
  task :build do
    image = "brandocorp/tarmac-supermarket-cookbook"
    tag = File.read('VERSION').strip
    sh <<-SH
      gem build tarmac-supermarket-cookbook.gemspec
      docker build -t #{image}:#{tag} .
    SH
  end
end
