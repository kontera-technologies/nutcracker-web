class Nutcracker.Views.Node extends Backbone.View
  template: JST['node']

  render: ->
    options = {
      is3D: true
      titleTextStyle:
        fontSize: 17.5
        color: '#333333'
      titleTextStyle:
        fontSize: 17.5
        color: '#333333'
      width: 300,
      height: 300,
      sliceVisibilityThreshold: 0
      chartArea:
        width: '100%'
        height: '80%'
      legend:
        position: 'bottom'
    }
    
    @$el.html @template {@model}
    @$el.find("#chart1").append new Backbone.GoogleChart({
      beforeDraw: (options)-> # move this to GoogleChart
        options.dataTable = google.visualization.arrayToDataTable options.dataTable
        new Nutcracker.Utils.GenericFormatter(
          humanize.filesize
        ).format(options.dataTable, 1)
      chartType: 'PieChart'
      options: _(title: 'Memory').extend options
      dataTable: [
          ['Memory', 'Memory'],
          ['Free', @model.get('freeMemory')],
          ['Used', @model.get('usedMemory')]
      ],
    }).render().el

    @$el.find("#chart2").append new Backbone.GoogleChart({
      beforeDraw: (options)-> # move this to GoogleChart
        options.dataTable = google.visualization.arrayToDataTable options.dataTable
        new Nutcracker.Utils.GenericFormatter(
          humanize.numberFormat
        ).format(options.dataTable, 1)
      chartType: 'PieChart'
      options: _(title: 'Hits').extend options
      dataTable: [
        ['Memory', 'Memory'],
        ['Hits', @model.get("info").hits],
        ['Misses', @model.get("info").misses]
      ],
    }).render().el

    this
