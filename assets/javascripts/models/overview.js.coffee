class Nutcracker.Models.Overview extends Backbone.Model
  initialize: (stats)->
    clusters = _ @get("clusters")
    collection = new Nutcracker.Collections.Clusters

    clusters.map ( data,cluster )->
      collection.add _.extend(name: cluster,data)

    clientConnections = _(collection.pluck("client_connections")).sum()

    serverConnections = 0
    for nodesCollection in collection.pluck("nodes")
      serverConnections += nodesCollection.serverConnections()


    @set "clusters",          collection
    @set "serverConnections", serverConnections
    @set "clientConnections", clientConnections

  nodes: =>
    _(@get("clusters").pluck("nodes")).chain()
      .pluck("models")
      .flatten()
      .value()
