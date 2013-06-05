class Nutcracker.Models.Cluster extends Backbone.Model
  initialize : ( object ) ->
    collection = new Nutcracker.Collections.Nodes
    _( object.nodes ).map (data, node)=>
      collection.add _.extend({url:node},data)
    @set("nodes",collection)
