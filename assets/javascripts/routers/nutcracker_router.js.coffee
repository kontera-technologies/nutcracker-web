class Nutcracker.Routers.Overview extends Backbone.Router
  routes:
    '' : 'index'

  initialize: ->
    @index()

  index: ->
    Nutcracker.screen.body new
      Nutcracker.Views.Overview model: Nutcracker.overview
