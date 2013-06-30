Nutcracker Web
=============

[Nutcracker](https://github.com/kontera-technologies/nutcracker) web interface plugin

<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic1.png" align="middle"/></br>

<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic2.png" align="middle"/></br>

<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic3.png" align="middle"/></br>

<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic4.png" align="middle"/></br>

### Installation 
add this to your Gemfile and run `bundle install`
```
gem 'nutcracker-web'
```

Or 
```
$ gem install nutcracker-web
```

### Usage
example app 
```ruby
require 'nutcracker'
require 'nutcracker/web'

# Start nutcracker
nutcracker = Nutcracker.start(config_file: 'cluster.conf')

# Start the web service on port 1234
nutcracker.use(:graphite, port: 1234)

# Sleeping....
nutcracker.join
```

`Nutcracker-Web` takes default [Rack](https://github.com/rack/rack) adapter [options](https://github.com/rack/rack/blob/master/lib/rack/server.rb#L187..L199)

