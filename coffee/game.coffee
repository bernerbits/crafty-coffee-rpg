requirejs ['../js/crafty-min', 'game_constants', 'components', 'scenes'], ->
  Crafty.init Consts.width, Consts.height
  Crafty.background 'rgb(87, 109, 20)'
  Crafty.scene 'Loading'
