class Nutcracker.Views.Overview extends Backbone.View
  template: JST['overview']

  render: ->
    @$el.html @template({@model})
    this
