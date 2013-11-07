$:.unshift File.expand_path '../lib', __FILE__
require 'nutcracker/web'
require 'rake'
require 'rubygems/package_task'
require "rake/testtask"

desc "Compile assets"
task :compile do
  require 'logger'
  require 'pathname'
  require 'sprockets'
  require 'uglifier'
  require 'eco'

  rm_rf 'public'
  mkdir_p 'public/assets'
  build_dir = Pathname(File.dirname(__FILE__)).join("public/assets")
  
  environment = Nutcracker::Web::App.assets
  environment.logger = Logger.new STDOUT
  environment.js_compressor = Uglifier.new(mangle: true)
  
  %w( javascripts/application.js stylesheets/application.css ).each do |target|
    target = File.expand_path("../assets/#{target}",__FILE__)
    environment.logger.info "#{'#'*10} Building #{target} #{'#'*10} "
    asset = environment[target] or abort "Unknown target #{target.inspect}"
    prefix, basename = asset.pathname.to_s.split('/')[-2..-1]
    asset.write_to build_dir.join(basename)
  end
end

task :build => [:compile] do
  Gem::PackageTask.new(eval File.read 'nutcracker-web.gemspec') do |pkg|
    pkg.need_zip = false
    pkg.need_tar = false
  end
  Rake::Task["gem"].invoke
end

task :gem do
  abort "Please use rake build instead"
end

task :install => [:build] do
   sh "gem install pkg/nutcracker-web"
   Rake::Task['clobber_package'].execute
end

## Tests stuff
task :default => :test

Rake::TestTask.new(:test) do |t|
  t.libs << "tests"
  t.pattern = "tests/**/*_test.rb"
end
