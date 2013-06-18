class Nutcracker.Views.Navbar extends Backbone.View
  className: "navbar navbar-inverse navbar-fixed-top"
  template: JST['navbar']
  
  initialize: =>
    Backbone.history.bind "all", @routeChange

  render: ->
    $(@el).html @template {@model}
    this

  resetButtons: ->
    @$el.find("li").removeClass 'active'

  activate: ( id )=>
    @$(id).addClass 'active'

  routeChange: (route, object, action, args) =>
    @resetButtons()
    if /index/g.test action
      @activate '#overview'
    if /showConfig/.test action
      @activate '#config'
    else if /showCluster/ig.test action
      @activate '#clusters'
    else if /showNode/gi.test action
      @activate '#nodes'
    
