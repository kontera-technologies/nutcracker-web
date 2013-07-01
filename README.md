Nutcracker Web
=============

[Nutcracker](https://github.com/kontera-technologies/nutcracker) web interface plugin<br/>
<a href="https://rubygems.org/gems/nutcracker-web"><img src=https://fury-badge.herokuapp.com/rb/nutcracker-web.png></a> 

<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic3.png"/></br>

### Disclaimer
this project is still in its early stages, so things could be a little buggy, if you find one, feel free to [report](https://github.com/kontera-technologies/nutcracker-web/issues) it.

### Dependencies
- Ruby 1.9+
- [Nutcracker](https://github.com/kontera-technologies/nutcracker)

### Installation 
add this to your Gemfile
```
gem 'nutcracker-web'
```

And then execute:
```
$ bundle install
```

### Usage
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

you can pass default [Rack](https://github.com/rack/rack) [options](https://github.com/rack/rack/blob/master/lib/rack/server.rb#L187..L199) to `Nutcracker#use` ( like :Host, :server etc)

### Custom Webserver
to use a different webserver like [thin](http://code.macournoyer.com/thin/)

```ruby
require 'nutcracker'
require 'nutcracker/web'
require 'thin'

nutcracker = Nutcracker.start(config_file: 'cluster.conf')
nutcracker.use(:web, Port: 1234, server: :thin)
nutcracker.join
```

### Developer
to run nutcracker-web with stub data
- `bundle install`
- run the `rackup` command to start the service.
- edit `example.json`.
- client Backbone app is under `assets` and the Sinatra backend is under the `lib` directory.

### Packaging & Testing
- `rake compile` : compile the assets into a single application.{js,css} file under the public directory
- `rake build` : compile the assets & builds a new gem
- `rake test` : runs the jasmine tests suite

### Warranty
This software is provided “as is” and without any express or implied warranties, including, without limitation, the implied warranties of merchantability and fitness for a particular purpose.

### More PNGs
<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic1.png"/></br>
<hr>
<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic2.png"/></br>
<hr>
<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic4.png"/></br>