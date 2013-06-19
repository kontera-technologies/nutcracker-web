require "rack"

module Nutcracker
  module Web
    def self.start nutcracker, options
      @thread = Thread.new do
        Thread.current[:nutcracker] = nutcracker
        rack = Rack::Server.start({
          :environment => options.fetch(:environment,'production'),
          :pid => nil,
          :Port => options.fetch(:port,9293),
          :Host => '0.0.0.0',
          :AccessLog => [],
          :config => File.expand_path("../../../config.ru", __FILE__)
        })
      end
    end
    
    def self.stop
      @thread.kill
    end

    autoload :App, 'nutcracker/web/app'
  end
end
