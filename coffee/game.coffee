root = exports ? this

root.Game =
  start: ->
    Crafty.init Consts.width, Consts.height
    Crafty.background 'rgb(249, 223, 125)'
    Crafty.scene 'Game'
