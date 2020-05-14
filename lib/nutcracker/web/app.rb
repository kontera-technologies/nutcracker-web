require 'open-uri'
require 'json'
require 'tilt/haml'
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

      get '/staus' do
        # @nutcracker.config.values.map {|x|
        #   x["servers"] # redis instancees
        #   x["listen"]
        # } # nutcracker
        "hello world"

        # def scan_port(port,ip)
        #   socket = TCPSocket.new(ip,port)
        #   return "ok"
        # rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
        #   return "not"
        # end
        #
        # i=0
        # results = []
        # threads = []
        #
        # loop do
        #     threads << Thread.new {results << scan_port(ports[i],ips[i])}
        #     sleep 0.001
        #     i+=1
        #     break if i==ips.count
        #   end
        #
        # threads.each(&:join)
        # if results.include? 'not'
        #   status 401
        # else
        #   status 200
        # end
      end

      get '/overview.json' do
        content_type :json
        overview.to_json
        "hello world"
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
