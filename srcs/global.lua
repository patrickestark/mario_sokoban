
TILE_W = 64
TILE_H = 64

MAP_W = 11
MAP_H = 11

WIN_W = TILE_W * MAP_W
WIN_H = TILE_H * MAP_H

DIR_UP = 0
DIR_DOWN = 1
DIR_LEFT = 2
DIR_RIGHT = 3

gameState = "game"

function exitGame()
	love.event.quit()
end
