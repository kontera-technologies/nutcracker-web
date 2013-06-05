class Nutcracker.Views.Navbar extends Backbone.View
  className: "navbar navbar-inverse navbar-fixed-top"
  template: JST['navbar']
  events:
    'click li' : 'buttonClick'

  render: ->
    $(@el).html @template({@model})
    this

  buttonClick: ( event ) ->
    button = $(event.currentTarget)
    return unless button.attr("class")
    return if /dropdown/.test button.attr("class")
    @resetButtons()
    @highlightButton button

  resetButtons: ->
    @$el.find("li").removeClass 'active'

  highlightButton: ( button ) ->
    button.addClass 'active'
