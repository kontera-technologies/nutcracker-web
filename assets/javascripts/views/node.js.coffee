class Nutcracker.Views.Node extends Backbone.View
  template: JST['node']

  render: ->
    @curIndex = @collection.indexOf(@model)
    @nextNode = @collection.at @curIndex+1
    @prevNode = @collection.at @curIndex-1

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
    
    @$el.html @template {@model,@nextNode,@prevNode}
    @$el.find("#chart1").append new Backbone.GoogleChart({
      chartType: 'PieChart'
      formatter:
        callback: humanize.filesize
        columns: [1]
      options: _(title: 'Memory').extend options
      dataTable: [
          ['Memory', 'Memory'],
          ['Free', @model.get('freeMemory')],
          ['Used', @model.get('usedMemory')]
      ],
    }).render().el

    @$el.find("#chart2").append new Backbone.GoogleChart({
      formatter:
        callback: humanize.numberFormat
        columns: [1]
      chartType: 'PieChart'
      options: _(title: 'Hits').extend options
      dataTable: [
        ['Memory', 'Memory'],
        ['Hits', @model.get("info").hits],
        ['Misses', @model.get("info").misses]
      ],
    }).render().el

    this
