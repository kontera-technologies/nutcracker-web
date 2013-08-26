require 'open-uri'
require 'json'
require 'haml'
require 'sinatra'
require 'json'

module Nutcracker
  module Web
    class App < Sinatra::Base
      enable :inline_templates
      set :root, File.expand_path('../'*4,__FILE__)

      def initialize(nutcracker, external_servers = [])
        @nutcracker = nutcracker
        @external_servers = external_servers
        super()
      end

      get '/' do
        haml :index
      end

      get '/overview.json' do
        content_type :json
        overview.to_json
      end
      
      def overview
        @nutcracker.overview.tap do |internal|
          internal["clusters"] += overview_from_external_servers["clusters"]
        end
      end
      
      def self.assets
        require 'sprockets'
        Sprockets::Environment.new { |env|
          %w(javascripts stylesheets templates).each { |asset|
            env.append_path File.join(settings.root,"assets/#{asset}")
          }
        }
      end
      
      private
      
      def overview_from_external_servers
        {"clusters" => []}.tap do |data|
          Queue.new.tap do |q|          
            @external_servers.map do |server|
              Thread.new { q.push JSON.parse(open("http://#{server}/overview.json").read) }
            end.each(&:join)
            data["clusters"] += q.pop["clusters"] while not q.empty?
          end # queue
        end # data
      end # def
      
    end
  end
end

__END__

@@ layout
%html
  %head
    %title Nutcracker-Web
    %script(type='text/javascript' src='http://www.google.com/jsapi')
    %script(type='text/javascript' src='assets/application.js')
    %link(rel='stylesheet' href='assets/application.css')
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
