Nutcracker Web
=============

[Nutcracker](https://github.com/kontera-technologies/nutcracker) web interface plugin

<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic1.png"/></br>
<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic2.png"/></br>
<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic3.png"/></br>
<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic4.png"/></br>

### Dependencies
- Ruby 1.9.2+
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
example app 
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

`Nutcracker-Web` takes default [rack](https://github.com/rack/rack) [options](https://github.com/rack/rack/blob/master/lib/rack/server.rb#L187..L199)

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

