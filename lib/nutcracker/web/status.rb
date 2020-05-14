require 'socket'
require 'yaml'
require 'sinatra'
require 'thread'

module Nutcracker
  module Web
    class Status < Sinatra::Base
      # enable :inline_templates
      # set :root, File.expand_path('../'*4,__FILE__)
      #
      # def initialize(nutcracker, external_servers = [])
      #   @nutcracker = nutcracker
      #   @external_servers = external_servers
      #   super()
      # end

      set :port, 8080
      get '/status' do

        def scan_port(port,ip)
          socket = TCPSocket.new(ip,port)
          return "ok"
        rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
          return "not"
        end

        def self.start
          i=0
          results = []
          threads = []

          loop do
              threads << Thread.new {results << scan_port(ports[i],ips[i])}
              sleep 0.001
              i+=1
              break if i==ips.count
            end

          threads.each(&:join)
          if results.include? 'not'
            status 401
          else
            status 200
          end
        end
      end
    end
  end
end

# def scan_port(port , ip)
#   socket = Socket.new(:INET, :STREAM)
#   remote_addr = Socket.sockaddr_in(port, ip)
#   begin
#     socket.connect_nonblock(remote_addr)
#   rescue Errno::EINPROGRESS
#   end
#   sockets = IO.select(nil, [socket] , nil, 1)
#
#   if sockets
#     return "ok"
#     p sockets
#   else
#     return "not"
#   end
# end
