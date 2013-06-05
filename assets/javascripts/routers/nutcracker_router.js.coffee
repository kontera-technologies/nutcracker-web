class Nutcracker.Routers.Dashboard extends Backbone.Router
  routes:
    '' : 'index'

  initialize: ->
    stats = $('#container').data("clusters")["clusters"]
    collection = Nutcracker.Collections.Clusters.fromStats stats
    $('#navbar').html (new Nutcracker.Views.Navbar({collection})).render().el
    $('#container').html "shuki"

  index: ->
