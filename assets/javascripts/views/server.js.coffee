class Nutcracker.Views.Server extends Backbone.View
  template: JST['server']

  render: ->
    @$el.html @template({@model})
    this
