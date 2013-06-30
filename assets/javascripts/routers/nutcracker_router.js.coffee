class Nutcracker.Routers.Overview extends Backbone.Router
  routes:
    '' : 'showOverview'
    'config' : 'showConfig'
    'clusters/:cluster' : 'showCluster'
    'nodes/:node' : 'showNode'

  initialize: ->
    @showOverview()

  showOverview: =>
      @_show Nutcracker.Views.Overview

  showCluster: (cluster)=>
    collection = Nutcracker.overview.clusters()
    model = collection.findWhere name: cluster
    @_show Nutcracker.Views.Cluster, {model, collection}

  showNode: ( node )=>
    collection = Nutcracker.overview.nodes()
    model = collection.findWhere hostname: node
    @_show  Nutcracker.Views.Node, {model,collection}

  showConfig: ()=>
    @_show  Nutcracker.Views.Config

  _show: (view,options = model: Nutcracker.overview) =>
    Nutcracker.screen.body new view options

