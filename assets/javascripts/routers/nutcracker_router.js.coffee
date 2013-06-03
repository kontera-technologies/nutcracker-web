class Nutcracker.Routers.Dashboard extends Backbone.Router
  routes:
    '' : 'index'

  initialize: ->
    $('#navbar').html (new Nutcracker.Views.Navbar).render().el
    $('#container').html "shuki"

  index: ->
    console.log "in here"
