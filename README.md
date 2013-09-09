Nutcracker Web <a href="https://rubygems.org/gems/nutcracker-web"><img src=https://fury-badge.herokuapp.com/rb/nutcracker-web.png></a> 
=============

Web interface plugin for [nutcracker-ruby](https://github.com/kontera-technologies/nutcracker)<br/>


<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic3.png"/></br>

## Disclaimer
this project is still in its early stages so things could be a little bit buggy, if you find one feel free to report it @ our issue [tracker](https://github.com/kontera-technologies/nutcracker-web/issues).<br/>
Also nutcracker-web only supports Redis instances for now.

## Dependencies
- Ruby 1.9+
- [nutcracker-ruby](https://github.com/kontera-technologies/nutcracker)

## Installation
with `bundler` just add this line to your `Gemfile` and then execute `bundle install`
```
gem 'nutcracker-web'
```
else you can manually install it by running
```
gem install nutcracker-web
```

## Usage
After starting the nutcracker service via [nutcracker-ruby](https://github.com/kontera-technologies/nutcracker) just activate the `nutcracker-web` plugin:
```ruby
require 'nutcracker'
require 'nutcracker/web'

# Start nutcracker
nutcracker = Nutcracker.start(config_file: 'cluster.conf')

# Start the web service on port 1234 using Webrick
nutcracker.use(:web, Port: 1234)

# Sleeping....
nutcracker.join
```

> you can pass default [Rack](https://github.com/rack/rack) [options](https://github.com/rack/rack/blob/master/lib/rack/server.rb#L187..L199) to `Nutcracker#use` ( like :Host, :server etc)

## Custom Webserver
to use a different webserver like [thin](http://code.macournoyer.com/thin/)

```ruby
require 'nutcracker'
require 'nutcracker/web'
require 'thin'

nutcracker = Nutcracker.start(config_file: 'cluster.conf')
nutcracker.use(:web, Port: 1234, server: :thin)
nutcracker.join
```

## Gotchas
- `redis.conf` : don't forget to configure the `maxmemory` attribute for each Redis instance

## Developer ?
to run nutcracker-web with stub data
- `bundle install`
- run the `rackup` command to start the service.
- edit `example.json`.
- client Backbone app is under `assets` and the Sinatra backend is under the `lib` directory.

## Packaging & Testing
- `rake compile` : compile the assets into a single application.{js,css} file under the public directory
- `rake build` : compile the assets & builds a new gem
- `rake test` : runs the jasmine tests suite

## More PNGs
<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic1.png"/></br>
<hr>
<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic2.png"/></br>
<hr>
<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic4.png"/></br>

## Warranty
This software is provided “as is” and without any express or implied warranties, including, without limitation, the implied warranties of merchantability and fitness for a particular purpose.
