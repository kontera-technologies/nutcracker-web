class Nutcracker.Models.Overview extends Backbone.Model
  initialize: ->
    clientConnections = _(@get("clusters").pluck("client_connections")).sum()

    serverConnections = 0
    for nodesCollection in @get("clusters").pluck("nodes")
      serverConnections += nodesCollection.serverConnections()

    @set "serverConnections", serverConnections
    @set "clientConnections", clientConnections

  nodes: =>
    new Backbone.Collection(_(@get("clusters").pluck("nodes")).chain()
      .pluck("models")
      .uniq((o)-> o.server_name)
      .flatten()
      .value()
    )

  clusters: =>
    @get "clusters"

  set: ( attributes, options ) ->
    if attributes.clusters? and attributes.clusters not instanceof Nutcracker.Collections.Clusters
      attributes.clusters = new Nutcracker.Collections.Clusters attributes.clusters

    Backbone.Model.prototype.set.call(@, attributes, options)
