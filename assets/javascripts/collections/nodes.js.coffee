class Nutcracker.Collections.Nodes extends Backbone.Collection
  initialize: ->
    @model = Nutcracker.Models.Node

  serverConnections: =>
    _(@pluck("server_connections")).sum()

