requirejs ['../js/crafty-min', 'game_constants', 'components', 'scenes'], ->
  Crafty.init Consts.width, Consts.height
  Crafty.background 'rgb(249, 223, 125)'
  Crafty.scene 'Game'
