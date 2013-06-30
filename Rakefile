$:.unshift File.expand_path '../lib', __FILE__
require 'nutcracker/web/version'
require 'rake'
require 'rubygems/package_task'
require "rake/testtask"

Nutcracker::Web::GemSpec = eval File.read 'nutcracker-web.gemspec'

task :gem => [:clobber_package]

Gem::PackageTask.new Nutcracker::Web::GemSpec do |p|
  p.gem_spec = Nutcracker::Web::GemSpec
end

task :install => [:gem] do
   sh "gem install pkg/nutcracker"
   Rake::Task['clobber_package'].execute
end

## Tests stuff
task :default => :test

Rake::TestTask.new(:test) do |t|
  t.libs << "tests"
  t.pattern = "tests/**/*_test.rb"
end
