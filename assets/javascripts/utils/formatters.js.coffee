class Nutcracker.Utils.GenericFormatter
  constructor: (@fn)->
  format: (data, c)=>
    [0..data.getNumberOfRows()-1].map (i)=>
      data.setFormattedValue(i,c,@fn data.getValue(i,c))
  
