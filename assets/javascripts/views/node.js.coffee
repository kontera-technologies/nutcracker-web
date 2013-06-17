class Nutcracker.Views.Node extends Backbone.View
  template: JST['node']

  render: ->
    info = @model.get("info")
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
    
    charts = [
      new Backbone.GoogleChart({
        chartType: 'PieChart'
        options: _(title: 'Memory (GB)').extend options
        dataTable: [
            ['Memory', 'Memory'],
            ['Free', @model.get('freeMemory')],
            ['Used', @model.get('usedMemory')]
        ],
      }),

      new Backbone.GoogleChart({
        chartType: 'PieChart'
        options: _(title: 'Hits').extend options
        dataTable: [
            ['Memory', 'Memory'],
            ['Hits', info.hits],
            ['Misses', info.misses]
        ],
      })
    ]

    @$el.html @template {@model}

    @$el.find("#chart1").append charts[0].render().el
    @$el.find("#chart2").append charts[1].render().el

    this
