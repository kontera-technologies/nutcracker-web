class Nutcracker.Views.Config extends Backbone.View
  template: JST["config"]

  render: ->
    @$el.html @template {@model}
    this
