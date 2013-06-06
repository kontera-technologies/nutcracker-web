class Nutcracker.Routers.Dashboard extends Backbone.Router
  routes:
    '' : 'index'

  initialize: ->
    $('#navbar').html (new Nutcracker.Views.Navbar(@_options())).render().el
    $('#footer').html (new Nutcracker.Views.Footer(@_options())).render().el
    @index()

  index: ->
    $('#container').html (new Nutcracker.Views.Overview(@_options())).render().el

  _options: ->
    model: Nutcracker.overview
