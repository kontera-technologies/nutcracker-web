class Nutcracker.Models.Node extends Backbone.Model
  initialize: ->
    @set 'hostname',@get('server_url')?.replace(/redis:\/\//,'')
