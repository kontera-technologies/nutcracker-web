class Nutcracker.Views.Footer extends Backbone.View
  className: "container navbar navbar-fixed-bottom navbar-inverse"
  template: JST['footer']
  
  render: ->
    @$el.html @template({@model})
    this

