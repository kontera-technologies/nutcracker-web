require 'haml'
require 'sinatra'
require 'sprockets'
require 'json'

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

        @data = {:clusters=>[{:nodes=>[{:server_url=>"redis://shuki.tuki.kontera.com:6379", :info=>{"connections"=>96, "used_memory"=>21474704928.0, "used_memory_rss"=>23039680512.0, "fragmentation"=>1.07, "expired_keys"=>40852366, "evicted_keys"=>7361387, "hits"=>1739042393, "misses"=>66207005, "keys"=>24302181, "max_memory"=>21474836480, "hit_ratio"=>0.9633252862051362}, "server_eof"=>0, "server_err"=>0, "server_timedout"=>0, "server_connections"=>0, "requests"=>0, "request_bytes"=>0, "responses"=>0, "response_bytes"=>0, "in_queue"=>0, "in_queue_bytes"=>0, "out_queue"=>0, "out_queue_bytes"=>0}], :name=>"shuki_cluster", "client_eof"=>0, "client_err"=>0, "client_connections"=>0, "server_ejects"=>0, "forward_error"=>0, "fragments"=>0}, {:nodes=>[{:server_url=>"redis://shukiiii.bla.kontera.com:6379", :info=>{"connections"=>96, "used_memory"=>21474707440.0, "used_memory_rss"=>23039680512.0, "fragmentation"=>1.07, "expired_keys"=>40852367, "evicted_keys"=>7361387, "hits"=>1739042486, "misses"=>66207005, "keys"=>24302183, "max_memory"=>21474836480, "hit_ratio"=>0.9633252880944865}, "server_eof"=>0, "server_err"=>0, "server_timedout"=>0, "server_connections"=>0, "requests"=>0, "request_bytes"=>0, "responses"=>0, "response_bytes"=>0, "in_queue"=>0, "in_queue_bytes"=>0, "out_queue"=>0, "out_queue_bytes"=>0}], :name=>"page_data_cluster", "client_eof"=>0, "client_err"=>0, "client_connections"=>0, "server_ejects"=>0, "forward_error"=>0, "fragments"=>0}], "service"=>"nutcracker", "source"=>"Eran-Levis-MacBook-Pro.local", "version"=>"0.2.4", "uptime"=>60, "timestamp"=>1370771244}
        haml :index
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
  #container{ "data-clusters" => @data.to_json }
    loading...
#footer
- 3.times do
  %br
