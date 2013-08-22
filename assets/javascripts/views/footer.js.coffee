class Nutcracker.Views.Footer extends Backbone.View
  className: "container navbar navbar-fixed-bottom navbar-inverse"
  template: JST['footer']
  
  render: =>
    @$el.html @template({@model})
    @$el.find('#lastUpdate').html("Last updated: " + humanize.relativeTime(@model.get("initializeTime")/1000))
    setTimeout(@render,1000)
    this
    

