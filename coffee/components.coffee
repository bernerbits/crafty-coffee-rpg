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
    @requires 'Actor, Solid, spr_tree'

Crafty.c 'Bush',
  init: ->
    @requires 'Actor, Solid, spr_bush'

Crafty.c 'Village',
  init: ->
    @requires 'Actor, spr_village'

  collect: ->
    @destroy()
    if Crafty('Village').length == 0
      Crafty.scene('Victory')

Crafty.c 'PlayerCharacter',
  init: ->
    @requires 'Actor, Fourway, Collision, spr_player'
    @fourway 4
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
