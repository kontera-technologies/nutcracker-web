_.prototype.sum = ->
  _.reduce(@_wrapped,((acc,num)-> acc+num),0)

_.prototype.average = ->
  @sum() / parseFloat @_wrapped.length

