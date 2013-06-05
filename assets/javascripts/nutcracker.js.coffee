# Namespace
window.Nutcracker =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Utils: {}

  initialize: ->
    Nutcracker.server = new Nutcracker.Models.Server $('#container').data("clusters")
    new Nutcracker.Routers.Dashboard()
    Backbone.history.start()

$( document ).ready ->
  Nutcracker.initialize()

