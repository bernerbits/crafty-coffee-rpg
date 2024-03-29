root = exports ? this

map_grid =
  width: 24
  height: 16
  tile:
    width: 16
    height: 16

root.Consts =
  max_villages: 5
  player_start:
    x: 5
    y: 5
  map_grid: map_grid
  width: map_grid.width * map_grid.tile.width
  height: map_grid.height * map_grid.tile.height
  text_css:
    'font-size': '24px'
    'font-family': 'Arial'
    color: 'white'
    'text-align': 'center'
