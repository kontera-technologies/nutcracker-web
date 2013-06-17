class Nutcracker.Views.Cluster extends Backbone.View
  template: JST['cluster']

  render: ->
    @$el.html @template {@model}

    options = {
      is3D: true
      #titlePosition: "in",
      #title: 'Memory (GB)',
      titleTextStyle: {fontSize: 17.5, color: '#333333'}
      slices: [{},{color: 'red'}]
      width: 300,
      height: 300,
      sliceVisibilityThreshold: 0
      chartArea: {
        width: '100%'
        height: '80%'
      }
      legend: {position: 'bottom'}
    }

    data = [['Node','Node']]

    @model.get("nodes").map (node)->
      data.push [node.get("hostname"),node.get("maxMemory")]

    chart = new Backbone.GoogleChart({
      chartType: 'PieChart'
      options: options
      dataTable: data
    })

    chart.on "select", (chart) =>
      Nutcracker.router.navigate @model.get("nodes").at(
        chart.getSelection()[0].row
      ).get('routeURL'), trigger: true

    @$el.find("#chart1").html chart.render().el

    data = [
      ['Memory', 'Memory']
      ['Free', @model.get("nodes").freeMemory() ]
      ['Used', @model.get('nodes').usedMemory() ]
    ]

    @$el.find("#chart2").html new Backbone.GoogleChart({
      chartType: 'PieChart'
      options: options
      dataTable: data
    }).render().el
    
    this
