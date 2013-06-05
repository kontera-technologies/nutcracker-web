_.prototype.sum = ->
  _.reduce(@_wrapped,((acc,num)-> acc+num),0)
