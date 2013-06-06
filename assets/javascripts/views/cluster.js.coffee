class Nutcracker.Views.Cluster extends Backbone.View
  template: JST['cluster']

  render: ->
    @$el.html @template({@model})
    this
