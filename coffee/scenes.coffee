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
          rand = Math.random()
          if rand < 0.02
            Crafty.e('Village').at x,y if Crafty('Village').length < Consts.max_villages
          else if rand < 0.03
            Crafty.e('Tree').at x, y
          else if rand < 0.06
            Crafty.e('Bush').at x, y

    return

Crafty.scene 'Victory', ->
  text = Crafty.e '2D, DOM, Text'
  text.attr
    x: 0
    y: Consts.height/2 - 24
    w: Consts.width
  text.css Consts.text_css
  text.text 'Victory!'

  @startOver = ->
    @unbind 'KeyDown', @restart_game
    Crafty.scene 'Game'
  
  @restart_game = @bind 'KeyDown', @startOver

Crafty.scene 'Loading', ->
  text = Crafty.e '2D, DOM, Text'
  text.attr
    x: 0
    y: Consts.height/2 - 24
    w: Consts.width
  text.css Consts.text_css
  text.text 'Loading...'

  images = ['assets/hunter.png', 'assets/16x16_forest_1.gif']
  audio_formats = (f) -> f + fmt for fmt in ['mp3','ogg','aac']
  audio = audio_formats('assets/door_knock_3x.')
  assets = [images..., audio...]

  Crafty.load assets, ->
    Crafty.sprite 16, 'assets/16x16_forest_1.gif',
      spr_tree:    [0,0]
      spr_bush:    [1,0]
      spr_village: [0,1]

    Crafty.sprite 16, 'assets/hunter.png',
      spr_player: [0,2]
    , 0, 2

    Crafty.audio.add
      knock: audio_formats('assets/door_knock_3x.')

    Crafty.scene 'Game'
