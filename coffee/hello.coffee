root = exports ? this

class Game
  map_grid:
    width: 24
    height: 16
    tile:
      width: 16
      height: 16

  width: => @map_grid.width * @map_grid.tile.width

  height: => @map_grid.height * @map_grid.tile.height

  canvas_rect: (x,y) => 
    x: x * @map_grid.tile.width
    y: y * @map_grid.tile.height
    w: @map_grid.tile.width
    h: @map_grid.tile.height 

  start: =>
    Crafty.init @width(), @height()
    Crafty.background 'rgb(249, 223, 125)'

    for x in [0...@map_grid.width] by 1
      for y in [0...@map_grid.height] by 1
        at_edge = 
          x == 0 or
          x == @map_grid.width - 1 or
          y == 0 or
          y == @map_grid.height - 1

        if at_edge
          elem = Crafty.e '2D, Canvas, Color'
          elem.attr @canvas_rect x,y
          elem.color 'rgb(20, 125, 40)'
        else if Math.random() < 0.06
          elem = Crafty.e '2D, Canvas, Color'
          elem.attr @canvas_rect x,y
          elem.color 'rgb(20, 185, 40)'
    return

root.Game = new Game
