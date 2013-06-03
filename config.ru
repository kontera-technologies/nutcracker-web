$:.unshift File.expand_path('../lib',__FILE__)

require 'nutcracker/web/app'
require 'sinatra/reloader'

map '/assets' do
  run Nutcracker::Web::App.assets
end

map '/' do
  run Nutcracker::Web::App
end
