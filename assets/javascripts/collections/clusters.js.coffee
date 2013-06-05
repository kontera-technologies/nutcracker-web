class Nutcracker.Collections.Clusters extends Backbone.Collection
  @fromStats: (stats) ->
    collection = new @
    _( stats ).map ( data, cluster ) ->
      collection.add _.extend(name: cluster,data)
    collection

  initialize: ( object ) =>
    @model = Nutcracker.Models.Cluster

