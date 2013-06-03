require 'haml'
require 'sinatra'
require 'sprockets'

module Nutcracker
  module Web
    class App < Sinatra::Base
      enable :inline_templates

      set :root,   File.expand_path('../'*4,__FILE__)

      set :assets, Sprockets::Environment.new { |env|
        env.append_path 'assets/javascripts'
        env.append_path 'assets/stylesheets'
        env.append_path 'assets/templates'
      }

      get '/' do
        haml :index
      end

    end
  end
end

__END__

@@ layout
%html
  %script(type='text/javascript' src='assets/application.js')
  %link(rel='stylesheet' href='assets/application.css')
  = yield

@@ index
.container
  #navbar
  #container
    loading...

