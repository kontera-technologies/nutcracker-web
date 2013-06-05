class Nutcracker.Models.Server extends Backbone.Model
  initialize: (stats)->
    clusters = _ @get("clusters")
    collection = new Nutcracker.Collections.Clusters

    clusters.map ( data,cluster )->
      collection.add _.extend(name: cluster,data)
    @set("clusters",collection)

