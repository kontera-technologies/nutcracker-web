require "rack"

module Nutcracker
  module Web
    def self.start(nutcracker, o = {})
      @thread = Thread.new do
        Thread.current.abort_on_exception=true

        app = Rack::URLMap.new(o.fetch(:context,"/") =>
          App.new(nutcracker, o.fetch(:external_servers,[])))

        Rack::Server.start(
          {
            :app => app,
            :environment => 'production',
            :pid => nil,
            :Port => 9292,
            :Host => '0.0.0.0',
            :AccessLog => []
          }.merge(o)
        )
      end
      self
    end

    def self.join
      @thread.join
    end

    def self.stop
      @thread.kill
    end

    autoload :App, 'nutcracker/web/app'
  end
end
