class Nutcracker.Collections.Nodes extends Backbone.Collection
  initialize: ->
    @model = Nutcracker.Models.Node

  add: (nodes)=>
    @any((obj)-> obj.get("server_url") == nodes[0].server_url) or super

  serverConnections: =>
    _(@pluck("server_connections")).sum()

  freeMemory: =>
    _(@pluck("freeMemory")).sum()

  maxMemory: =>
    _(@pluck("maxMemory")).sum()

  usedMemory: =>
    _(@pluck("usedMemory")).sum()

