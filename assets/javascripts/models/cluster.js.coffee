class Nutcracker.Models.Cluster extends Backbone.Model
  initialize: ->
    @set("routeURL","#clusters/#{@get("name")}")

  parse: ( response ) ->
    response.nodes = new Nutcracker.Collections.Nodes response.nodes
    response

  set: ( attributes, options ) ->
    if attributes.nodes? and attributes.nodes not instanceof Nutcracker.Collections.Nodes
      attributes.nodes = new Nutcracker.Collections.Nodes attributes.nodes

    Backbone.Model.prototype.set.call(@, attributes, options)

