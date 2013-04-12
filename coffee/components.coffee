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
    Crafty.audio.play('knock')
    if Crafty('Village').length == 0
      Crafty.scene('Victory')

Crafty.c 'PlayerCharacter',
  init: ->
    @requires 'Actor, Fourway, Collision, spr_player, SpriteAnimation'
    @fourway 4
    @onHit 'Solid', @stopMovement
    @onHit 'Village', @visitVillage
    @animate 'PlayerMovingUp',    0, 0, 2
    @animate 'PlayerMovingRight', 0, 1, 2
    @animate 'PlayerMovingDown',  0, 2, 2
    @animate 'PlayerMovingLeft',  0, 3, 2

    animation_speed = 8
    @bind 'NewDirection', (data) ->
      @animate 'PlayerMovingRight', animation_speed, -1 if data.x > 0
      @animate 'PlayerMovingLeft',  animation_speed, -1 if data.x < 0
      @animate 'PlayerMovingDown',  animation_speed, -1 if data.y > 0
      @animate 'PlayerMovingUp',    animation_speed, -1 if data.y < 0
      @stop() if data.x == 0 and data.y == 0
    return

  stopMovement: ->
    @_speed = 0
    if @_movement
      @x -= @_movement.x
      @y -= @_movement.y
    this

  visitVillage: (data) ->
    data[0].obj.collect()
