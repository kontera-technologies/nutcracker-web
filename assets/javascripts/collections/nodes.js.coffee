class Nutcracker.Collections.Nodes extends Backbone.Collection
  initialize: ->
    @model = Nutcracker.Models.Node

  serverConnections: =>
    _(@pluck("server_connections")).sum()

  freeMemory: =>
    _(@pluck("freeMemory")).sum()

  maxMemory: =>
    _(@pluck("maxMemory")).sum()

  usedMemory: =>
    _(@pluck("usedMemory")).sum()

