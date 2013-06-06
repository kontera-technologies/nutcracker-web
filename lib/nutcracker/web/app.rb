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
        @data = {:clusters=>{"shuki_cluster"=>{"client_eof"=>0, "client_err"=>0, "client_connections"=>710, "server_ejects"=>0, "forward_error"=>0, "fragments"=>0, :nodes=>{"shuki.tuki.kontera.com:6379"=>{"server_eof"=>0, "server_err"=>0, "server_timedout"=>0, "server_connections"=>123, "requests"=>0, "request_bytes"=>0, "responses"=>0, "response_bytes"=>0, "in_queue"=>0, "in_queue_bytes"=>0, "out_queue"=>0, "out_queue_bytes"=>0, :info=>{"connections"=>95, "used_memory"=>21473803072.0, "used_memory_rss"=>22508728320.0, "fragmentation"=>1.05, "expired_keys"=>40005700, "evicted_keys"=>3949051, "hits"=>1615890856, "misses"=>63260621, "keys"=>24268216, "max_memory"=>21474836480, "hit_ratio"=>0.9623258402434172}}}}, "page_data_cluster"=>{"client_eof"=>0, "client_err"=>0, "client_connections"=>0, "server_ejects"=>0, "forward_error"=>0, "fragments"=>0, :nodes=>{"shuki.tuki.kontera.com:6379"=>{"server_eof"=>0, "server_err"=>0, "server_timedout"=>91, "server_connections"=>10, "requests"=>0, "request_bytes"=>0, "responses"=>0, "response_bytes"=>0, "in_queue"=>0, "in_queue_bytes"=>0, "out_queue"=>0, "out_queue_bytes"=>0, :info=>{"connections"=>95, "used_memory"=>21473821568.0, "used_memory_rss"=>22508728320.0, "fragmentation"=>1.05, "expired_keys"=>40005702, "evicted_keys"=>3949051, "hits"=>1615891120, "misses"=>63260624, "keys"=>24268221, "max_memory"=>21474836480, "hit_ratio"=>0.9623258444473259}}}}}, "service"=>"nutcracker", "source"=>"Eran-Levis-MacBook-Pro.local", "version"=>"0.2.4", "uptime"=>121, "timestamp"=>1370353322}

        haml :index
      end

    end
  end
end

__END__

@@ layout
%html
  %head
    %script(type='text/javascript' src='assets/application.js')
    %link(rel='stylesheet' href='assets/application.css')
    %link(rel="shortcut icon" href="http://www.fu.com/fu")
  %body
    = yield

@@ index
#navbar
.container
  #container{ "data-clusters" => @data.to_json }
    loading...
#footer
