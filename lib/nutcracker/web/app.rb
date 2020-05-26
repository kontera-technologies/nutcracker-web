require 'open-uri'
require 'json'
require 'tilt/haml'
require 'haml'
require 'sinatra'
require 'json'
require 'thread'
require 'socket'


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

      get '/status' do
        @nutcracker.config.values.map {|x|
          x["servers"] + [x["listen"]]}.flatten.map {|x|
            x.split(":")}.map {|x|
              Thread.new {TCPSocket.new(x[0],x[1]).close.nil? rescue false}}.map(&:value).all?.tap {|x|
                 status(x ? 200 : 401)
               }
      end

      get '/overview.json' do
        content_type :json
        overview.to_json
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

      def overview
        JSON.parse(@nutcracker.overview.to_json).tap do |internal|
          internal["clusters"] += overview_from_external_servers["clusters"]
        end
      end

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
    %script(type='text/javascript' src='https://www.google.com/jsapi')
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
