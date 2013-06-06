class Nutcracker.Utils.RegionManager
  constructor: (@navbarID="#navbar",@bodyID="#container",@footerID="#footer",@current={})->
  navbar: ( view )=> @_render(@navbarID,view)
  body:   ( view )=> @_render(@bodyID,  view)
  footer: ( view )=> @_render(@footerID,view)

  _render:(id,view)=>
    $(id).html view.render().el
    @current[id]?.remove
    @current[id]=view

    
