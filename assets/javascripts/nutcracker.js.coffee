# Namespace
window.Nutcracker =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Utils: {}
  reload: ->
    if window.location.hash == ""
      Nutcracker.router.navigate('/',trigger: true)
    else
      Nutcracker.router.navigate(window.location.hash,trigger: true)
  

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

