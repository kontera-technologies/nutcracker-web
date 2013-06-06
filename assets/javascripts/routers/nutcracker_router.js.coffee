class Nutcracker.Routers.Dashboard extends Backbone.Router
  routes:
    '' : 'index'

  initialize: ->
    $('#navbar').html @_render Nutcracker.Views.Navbar
    $('#footer').html @_render Nutcracker.Views.Footer
    @index()

  index: ->
    $('#container').html @_render Nutcracker.Views.Overview

  _render: (view, options = {model: Nutcracker.overview})->
    (new view(options)).render().el

