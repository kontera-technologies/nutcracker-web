class Nutcracker.Routers.Dashboard extends Backbone.Router
  routes:
    '' : 'index'

  initialize: ->
    collection = Nutcracker.Collections.Clusters.fromStats Nutcracker.stats
    $('#navbar').html (new Nutcracker.Views.Navbar({collection})).render().el
    $('#container').html "shuki"

  index: ->
