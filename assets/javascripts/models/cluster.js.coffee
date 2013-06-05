class Nutcracker.Models.Cluster extends Backbone.Model
  initialize : ( object ) ->
    @nodes = new Nutcracker.Collections.Nodes
    _( object.nodes ).map (data, node)=>
      @nodes.add _.extend({url:node},data)
