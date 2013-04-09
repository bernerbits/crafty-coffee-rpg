Crafty.scene 'Game', ->

    Crafty.e('PlayerCharacter').at Consts.player_start.x, Consts.player_start.y

    for x in [0...Consts.map_grid.width] by 1
      for y in [0...Consts.map_grid.height] by 1
        at_edge = 
          x == 0 or
          x == Consts.map_grid.width - 1 or
          y == 0 or
          y == Consts.map_grid.height - 1

        if at_edge
          Crafty.e('Tree').at x, y
        else if x != Consts.player_start.x and y != Consts.player_start.y
          if Math.random() < 0.06
            Crafty.e('Bush').at x, y
          else if Math.random() < 0.02 and Crafty('Village').length < Consts.max_villages
            Crafty.e('Village').at x, y

    return

Crafty.scene 'Victory', ->
  text = Crafty.e '2D, DOM, Text'
  text.attr
    x:15
    y:15
  text.text 'Victory!'

  @startOver = ->
    @unbind 'KeyDown', @restart_game
    Crafty.scene 'Game'
  
  @restart_game = @bind 'KeyDown', @startOver
