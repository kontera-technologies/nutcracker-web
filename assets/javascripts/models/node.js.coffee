class Nutcracker.Models.Node extends Backbone.Model
  @routeURL: (hostname)->
    "#/nodes/#{hostname.split(":")[0..1].join(":")}"

  initialize: ->
    @set 'clusters', []
    @set 'hostname',   @get('server_url')?.replace(/redis:\/\//,'')
    @set 'maxMemory',  @get('info').max_memory
    @set 'usedMemory', @get('info').used_memory
    @set 'freeMemory', @get('info').max_memory - @get('info').used_memory
    @set 'usedMemoryRss', @get('info').used_memory_rss
    @set 'fragmentation', @get('info').fragmentation
    @set 'freeMemory', 0 if @get('freeMemory') < 0
    @set 'hits',   @get('info').hits
    @set 'misses', @get('info').misses
    
    @set('maxMemory',@get('usedMemory')) if @get('maxMemory') == 0
    @set('hits',1) if @get('hits') == 0
    
    @set 'routeURL', @constructor.routeURL @get('hostname')
    
    