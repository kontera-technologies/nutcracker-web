class Nutcracker.Models.Cluster extends Backbone.Model
  @routeURL: (name)-> "#/clusters/#{name}"

  initialize: ->
    @set("routeURL",@constructor.routeURL @get 'name')

  set: ( attributes, options ) =>
    if attributes.nodes? and attributes.nodes not instanceof Nutcracker.Collections.Nodes
      attributes.nodes = new Nutcracker.Collections.Nodes attributes.nodes

    attributes.nodes?.map (model)=>
      model.get("clusters").push @
      model.set("clusters",_(model.get("clusters")).uniq())

    Backbone.Model.prototype.set.call(@, attributes, options)

