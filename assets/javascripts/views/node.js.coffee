class Nutcracker.Views.Node extends Backbone.View
  template: JST['node']

  render: ->
    @$el.html @template {@model}
    this
