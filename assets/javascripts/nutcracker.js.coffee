# Namespace
window.Nutcracker =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Utils: {}

  initialize: ->
    Nutcracker.stats = $('#container').data("clusters")["clusters"]
    new Nutcracker.Routers.Dashboard()
    Backbone.history.start()

$( document ).ready ->
  Nutcracker.initialize()

