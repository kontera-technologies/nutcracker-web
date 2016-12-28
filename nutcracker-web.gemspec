$:.unshift File.expand_path '../lib', __FILE__
require 'nutcracker/web/version'
require 'rake'
require 'rubygems/package_task'

Gem::Specification.new do |s|
  s.name                  = "nutcracker-web"
  s.version               = Nutcracker::Web::VERSION
  s.platform              = Gem::Platform::RUBY
  s.summary               = "Nutcracker Web Interface"
  s.description           = "Web interface for Nutcracker cluster"
  s.author                = "Eran Barak Levi"
  s.email                 = "eran@kontera.com"
  s.homepage              = 'http://www.kontera.com'
  s.required_ruby_version = '>= 1.9.1'
  s.rubyforge_project     = "ruby-nutcracker-web"
  s.files                 = %w(README.md Rakefile Gemfile Gemfile.lock public) + Dir.glob("{lib,public,bin}/**/*")
  s.require_path          = "lib"
  s.bindir                = "bin"
  s.executables           = %w(nutcracker-web)
  s.add_development_dependency 'minitest', '~> 5.0.0'
  s.add_development_dependency 'mocha', '~> 0.14.0'
  s.add_runtime_dependency 'nutcracker', '>= 0.4.1.20'
  s.add_runtime_dependency 'rack'
  s.add_runtime_dependency 'haml'
  s.add_runtime_dependency 'sinatra'
  s.add_runtime_dependency 'json'
end
