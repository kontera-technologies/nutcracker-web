require "rack"

module Nutcracker
  module Web
    def self.start nutcracker, options
      @thread = Thread.new do
        Thread.current.abort_on_exception=true
        Thread.current[:nutcracker] = nutcracker
        Rack::Server.start(
          {
            :environment => 'development',
            :pid => nil,
            :Port => 9393,
            :Host => '0.0.0.0',
            :AccessLog => [],
            :config => File.expand_path("../../../config.ru", __FILE__)
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
