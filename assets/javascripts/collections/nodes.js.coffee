class Nutcracker.Collections.Nodes extends Backbone.Collection
  initialize: ->
    @model = Nutcracker.Models.Node

  comparator : (node)->
    node.get "brand"
  
  add: (nodes)=>
    console.log nodes[0].server_url
    console.log @findWhere(server_url: nodes[0].server_url)
    return if @any((obj)-> obj.get("server_url") == nodes[0].server_url)
    super
          
  serverConnections: =>
    _(@pluck("server_connections")).sum()

  freeMemory: =>
    _(@pluck("freeMemory")).sum()

  maxMemory: =>
    _(@pluck("maxMemory")).sum()

  usedMemory: =>
    _(@pluck("usedMemory")).sum()

