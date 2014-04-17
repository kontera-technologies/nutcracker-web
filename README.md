Nutcracker Web <a href="https://rubygems.org/gems/nutcracker-web"><img src=https://fury-badge.herokuapp.com/rb/nutcracker-web.png></a> 
=============

Web interface plugin for [nutcracker-ruby](https://github.com/kontera-technologies/nutcracker)<br/>


<img src="https://github.com/kontera-technologies/nutcracker-web/raw/master/pics/pic3.png"/></br>

## Dependencies
- Ruby 1.9+

## Installation
```
gem install nutcracker-web
```

## Usage
```
$ nutcracker-web --help
Usage: nutcracker-web [web-options] -- [nutcracker-options]

[web-options]

  -s, --stats-port PORT            Nutcracker stats port - 22222
  -c, --config FILE                Nutcracker cluster config file
  -p, --port PORT                  Web interface listening port
  -b, --backend BACKEND            Web server to use ( needs to be Rack compliant )
  -d, --daemonize                  run in background
  -l, --launch                     launch Nutcracker instance as well
  -i, --pid FILE                   pid file

[nutcracker-options]

  -h, --help             : this help
  -V, --version          : show version and exit
  -t, --test-conf        : test configuration for syntax errors and exit
  -d, --daemonize        : run as a daemon
  -D, --describe-stats   : print stats description and exit
  -v, --verbosity=N      : set logging level (default: 5, min: 0, max: 11)
  -o, --output=S         : set logging file (default: stderr)
  -c, --conf-file=S      : set configuration file (default: conf/nutcracker.yml)
  -s, --stats-port=N     : set stats monitoring port (default: 22222)
  -a, --stats-addr=S     : set stats monitoring ip (default: 0.0.0.0)
  -i, --stats-interval=N : set stats aggregation interval in msec (default: 30000 msec)
  -p, --pid-file=S       : set pid file (default: off)
  -m, --mbuf-size=N      : set size of mbuf chunk in bytes (default: 16384 bytes)

```

conneting to a running instance of [twemproxy](https://github.com/twitter/twemproxy) and running the web interface on port 22122
```
$ nutcracker-web --config /etc/nutcracker/cluster.yml --port 22122
[2014-03-02 17:26:40] INFO  WEBrick 1.3.1
[2014-03-02 17:26:40] INFO  ruby 2.0.0 (2013-05-14) [x86_64-darwin11.4.2]
[2014-03-02 17:26:40] INFO  WEBrick::HTTPServer#start: pid=84800 port=22122
```

launching twemproxy and nutcracker-web
```
$ nutcracker-web --config /etc/nutcracker/cluster.yml --port 22122 --launch
[Sun Mar  2 17:26:37 2014] nc.c:187 nutcracker-0.3.0 built for Darwin 13.0.0 x86_64 started on pid 84801
[Sun Mar  2 17:26:37 2014] nc.c:192 run, rabbit run / dig that hole, forget the sun / and when at last the work is done / don't sit down / it's time to dig another one
[2014-03-02 17:26:40] INFO  WEBrick 1.3.1
[2014-03-02 17:26:40] INFO  ruby 2.0.0 (2013-05-14) [x86_64-darwin11.4.2]
[2014-03-02 17:26:40] INFO  WEBrick::HTTPServer#start: pid=84800 p
```

## Usage via code
After starting the twemproxy service via [nutcracker-ruby](https://github.com/kontera-technologies/nutcracker) just activate the `nutcracker-web` plugin:
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

## Disclaimer
this project is still in its early stages so things could be a little bit buggy, if you find one feel free to report it @ our issue [tracker](https://github.com/kontera-technologies/nutcracker-web/issues).<br/>
Also nutcracker-web only supports Redis instances for now.
