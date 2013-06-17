class Nutcracker.Models.Node extends Backbone.Model
  initialize: ->
    @set 'hostname',@get('server_url')?.replace(/redis:\/\//,'')
    @set 'maxMemory', parseInt(@get('info').max_memory/1024.0/1024/1024)
    @set 'usedMemory', parseInt(@get('info').used_memory/1024.0/1024/1024)
    @set 'freeMemory',parseInt((@get('info').max_memory - @get('info').used_memory)/1024.0/1024/1024)
    @set 'freeMemory', 0 if @get('freeMemory') < 0
    @set 'routeURL', "#nodes/#{@get('hostname')}"
