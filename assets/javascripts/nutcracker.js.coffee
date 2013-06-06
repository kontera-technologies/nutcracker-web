# Namespace
window.Nutcracker =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Utils: {}

  initialize: ->
    Nutcracker.overview = new Nutcracker.Models.Overview $('#container').data("clusters")
    new Nutcracker.Routers.Dashboard()
    Backbone.history.start()

$( document ).ready ->
  Nutcracker.initialize()

