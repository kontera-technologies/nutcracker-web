require "rack"

module Nutcracker
  module Web
    def self.start(nutcracker, options = {})
      $nutcracker = nutcracker
      @thread = Thread.new do
        Thread.current.abort_on_exception=true
        Rack::Server.start(
          {
            :app => Nutcracker::Web::App,
            :environment => 'production',
            :pid => nil,
            :Port => 9292,
            :Host => '0.0.0.0',
            :AccessLog => []
          }.merge( options )
        )
      end
      self
    end
    
    def self.stop
      @thread.kill
    end

    autoload :App, 'nutcracker/web/app'
  end
end
