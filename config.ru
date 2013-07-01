$:.unshift File.expand_path('../lib',__FILE__)

require 'nutcracker/web/app'

map '/assets' do
  run Nutcracker::Web::App.assets
end

map '/' do
  run Nutcracker::Web::App
end
