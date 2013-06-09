class Nutcracker.Models.Overview extends Backbone.Model
  initialize: ->
    clientConnections = _(@get("clusters").pluck("client_connections")).sum()

    serverConnections = 0
    for nodesCollection in @get("clusters").pluck("nodes")
      serverConnections += nodesCollection.serverConnections()

    @set "serverConnections", serverConnections
    @set "clientConnections", clientConnections

  nodes: =>
    _(@get("clusters").pluck("nodes")).chain()
      .pluck("models")
      .flatten()
      .value()

  urls: =>
    _(@nodes()).chain()
      .map((o) -> o.get("server_url"))
      .uniq()
      .value()

  parse: ( response ) ->
    response.clusters = new Nutcracker.Collections.Clusters response.clusters
    response

  set: ( attributes, options ) ->
    if attributes.clusters? and attributes.clusters not instanceof Nutcracker.Collections.Clusters
      attributes.clusters = new Nutcracker.Collections.Clusters attributes.clusters

    Backbone.Model.prototype.set.call(@, attributes, options)
