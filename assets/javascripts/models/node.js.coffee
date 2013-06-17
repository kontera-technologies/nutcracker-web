class Nutcracker.Models.Node extends Backbone.Model
  initialize: ->
    @set 'hostname',   @get('server_url')?.replace(/redis:\/\//,'')
    @set 'maxMemory',  @get('info').max_memory
    @set 'usedMemory', @get('info').used_memory
    @set 'freeMemory', @get('info').max_memory - @get('info').used_memory
    @set 'usedMemoryRss', @get('info').used_memory_rss
    @set 'fragmentation', @get('info').fragmentation
    @set 'freeMemory', 0 if @get('freeMemory') < 0
    @set 'routeURL', "#nodes/#{@get('hostname')}"
