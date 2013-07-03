$:.unshift File.expand_path('../lib',__FILE__)

require 'nutcracker/web/app'
require 'json'

def overview
  JSON.parse File.read(File.expand_path('../example.json',__FILE__))
end

nutcracker = self

map '/assets' do
  run Nutcracker::Web::App.assets
end

map '/' do
  run Nutcracker::Web::App.new nutcracker
end
