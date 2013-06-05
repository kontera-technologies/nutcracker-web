class Nutcracker.Routers.Dashboard extends Backbone.Router
  routes:
    '' : 'index'

  initialize: ->
    $('#navbar').html (new Nutcracker.Views.Navbar(model: Nutcracker.server)).render().el
    $('#footer').html (new Nutcracker.Views.Footer(model: Nutcracker.server)).render().el
    @index()

  index: ->
    $('#container').html (new Nutcracker.Views.Server(model: Nutcracker.server)).render().el
