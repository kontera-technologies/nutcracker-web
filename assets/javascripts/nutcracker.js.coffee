# Namespace
window.Nutcracker =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Utils: {}

  initialize: ->
    new Nutcracker.Routers.Dashboard()
    Backbone.history.start()

$( document ).ready ->
  Nutcracker.initialize()

