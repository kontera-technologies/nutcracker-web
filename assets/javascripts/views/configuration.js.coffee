class Nutcracker.Views.Configuration extends Backbone.View
  template: JST["configuration"]

  render: ->
    @$el.html @template {@model}
    this
