# Namespace
window.Nutcracker =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Utils: {}

  initialize: ->
    model = new Nutcracker.Models.Overview $('#container').data("clusters")
    Nutcracker.overview = model
    Nutcracker.screen = new Nutcracker.Utils.RegionManager
    Nutcracker.screen.navbar new Nutcracker.Views.Navbar {model}
    Nutcracker.screen.footer new Nutcracker.Views.Footer {model}
    Nutcracker.router = new Nutcracker.Routers.Overview
    Backbone.history.start()

$( document ).ready ->
  Nutcracker.initialize()

