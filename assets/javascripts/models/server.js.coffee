class Nutcracker.Models.Server extends Backbone.Model
  initialize: (stats)->
    clusters = _ @get("clusters")
    collection = new Nutcracker.Collections.Clusters

    clusters.map ( data,cluster )->
      collection.add _.extend(name: cluster,data)

    serverConnections = 0
    for nodeCollection in collection.pluck("nodes")
      serverConnections += _(nodeCollection.pluck("server_connections")).sum()

    @set "clusters", collection
    @set "serverConnections", serverConnections
    @set "clientConnections",_(collection.pluck("client_connections")).sum()
