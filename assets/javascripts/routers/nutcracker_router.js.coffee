class Nutcracker.Routers.Overview extends Backbone.Router
  routes:
    '' : 'index'
    'clusters/:cluster' : 'showCluster'

  initialize: ->
    @index()

  index: =>
      @_show( Nutcracker.Views.Overview )

  showCluster: (cluster)=>
    model = Nutcracker.overview.get("clusters").findWhere name: cluster
    @_show( Nutcracker.Views.Cluster, {model} )

  _show: (view,options = model: Nutcracker.overview) =>
    Nutcracker.screen.body new view options


