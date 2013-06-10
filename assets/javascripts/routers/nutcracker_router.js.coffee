class Nutcracker.Routers.Overview extends Backbone.Router
  routes:
    '' : 'index'
    'clusters/:cluster' : 'showCluster'
    'nodes/:node' : 'showNode'

  initialize: ->
    @index()

  index: =>
      @_show Nutcracker.Views.Overview

  showCluster: (cluster)=>
    model = Nutcracker.overview.clusters().findWhere name: cluster
    @_show Nutcracker.Views.Cluster, {model}

  showNode: ( node )=>
    model = Nutcracker.overview.nodes().findWhere hostname: node
    @_show  Nutcracker.Views.Node, {model}

  _show: (view,options = model: Nutcracker.overview) =>
    Nutcracker.screen.body new view options


