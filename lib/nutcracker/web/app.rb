require 'haml'
require 'sinatra'
require 'eco'
require 'sprockets'
require 'json'

module Nutcracker
  module Web
    class App < Sinatra::Base
      enable :inline_templates
      set :root, File.expand_path('../'*4,__FILE__)
      set :assets, Sprockets::Environment.new { |env|
        env.append_path File.join(settings.root,'assets/javascripts')
        env.append_path File.join(settings.root,'assets/stylesheets')
        env.append_path File.join(settings.root,'assets/templates')
      }

      get '/' do
        haml :index
      end
      
      def overview
        Thread.current[:nutcracker].overview rescue
         JSON.parse File.read File.join(settings.root,"example.json")
      end

    end
  end
end

__END__

@@ layout
%html
  %head
    %script(type='text/javascript' src='http://www.google.com/jsapi')
    %script(type='text/javascript' src='assets/application.js')
    %link(rel='stylesheet' href='assets/application.css')
    %link(rel="shortcut icon" href="http://publishers.kontera.com/favicon.ico")
  %body
    = yield

@@ index
#navbar
.container
  #container{ "data-clusters" => overview.to_json }
    loading...
#footer
- 3.times do
  %br
