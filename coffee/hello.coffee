root = exports ? this

root.Game =
  start: ->
    Crafty.init Consts.width, Consts.height
    Crafty.background 'rgb(249, 223, 125)'

    Crafty.e('PlayerCharacter').at 5, 5

    for x in [0...Consts.map_grid.width] by 1
      for y in [0...Consts.map_grid.height] by 1
        at_edge = 
          x == 0 or
          x == Consts.map_grid.width - 1 or
          y == 0 or
          y == Consts.map_grid.height - 1

        if at_edge
          Crafty.e('Tree').at x, y
        else if Math.random() < 0.06
          Crafty.e('Bush').at x, y
        else if Math.random() < 0.02 and Crafty('Village').length < Consts.max_villages
          Crafty.e('Village').at x, y

    return
