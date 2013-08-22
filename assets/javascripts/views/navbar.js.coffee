class Nutcracker.Views.Navbar extends Backbone.View
  className: "navbar navbar-inverse navbar-fixed-top"
  template: JST['navbar']
  events: 'click .auto-refresh-button' : 'autoRefresh'

  initialize: =>
    Backbone.history.bind "all", @resetButtons
    @listenTo(@model,'change', @render)
    @autoRefreshInterval = null

  resetButtons: =>
    @$el.find("li").removeClass('active')
    
    if @autoRefreshInterval
      @$("#auto-refresh-drop-down").addClass('active')
      @$("#auto-refresh-value-#{@autoRefreshInterval}").addClass('active')
    else
      @$("#auto-refresh-drop-down").removeClass("active")
      @$("#auto-refresh-drop-down").find('.active').removeClass("active")
    
    url = window.location.href 
    if /#\/config$/.test url
      @activate '#config'
    else if /#\/clusters\//.test url
      @activate '#clusters'
    else if /#\/nodes\//.test url
      @activate '#nodes'
    else
      @activate '#overview'
    
  autoRefresh: ( event ) =>
    interval = parseInt($(event.currentTarget).attr('value'))
    @autoRefreshTimer and clearInterval @autoRefreshTimer

    if interval == @autoRefreshInterval
      @autoRefreshInterval = null 
    else
      @autoRefreshInterval = interval
      @autoRefreshTimer = setInterval =>
         @model.fetch()
        ,@autoRefreshInterval*1000
    
    @resetButtons()
    event.preventDefault()
      
  activate: ( id )=>
    @$(id).addClass 'active'

  render: =>
    @$el.html @template {@model}
    @resetButtons()
    this