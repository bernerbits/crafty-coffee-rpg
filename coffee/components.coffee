root = exports ? this

Crafty.c 'Grid',
  init: ->
    @attr
      w: Consts.map_grid.tile.width
      h: Consts.map_grid.tile.height

  at: (x,y) ->
    @attr
      x: x*Consts.map_grid.tile.width
      y: y*Consts.map_grid.tile.height
    this

Crafty.c 'Actor',
  init: ->
    @requires '2D, Canvas, Grid'

Crafty.c 'Tree',
  init: ->
    @requires 'Actor, Color, Solid'
    @color 'rgb(20,125,40)'

Crafty.c 'Bush',
  init: ->
    @requires 'Actor, Color, Solid'
    @color 'rgb(20,185,40)'

Crafty.c 'Village',
  init: -> 
    @requires 'Actor, Color'
    @color 'rgb(170, 125, 40)'

  collect: ->
    @destroy()

Crafty.c 'PlayerCharacter',
  init: ->
    @requires 'Actor, Fourway, Color, Collision'
    @fourway 4
    @color 'rgb(20,75,40)'
    @onHit 'Solid', @stopMovement
    @onHit 'Village', @visitVillage
    return

  stopMovement: ->
    @_speed = 0
    if @_movement
      @x -= @_movement.x
      @y -= @_movement.y
    this

  visitVillage: (data) ->
    data[0].obj.collect()
