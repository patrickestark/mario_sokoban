
require "srcs.global"

local spritesManager = {}

spritesManager.load = function()
	spritesManager.texs =
		{
			wall = love.graphics.newImage("img/wall.png"),
			box = love.graphics.newImage("img/box.png"),
			box_ok = love.graphics.newImage("img/box_ok.png"),
			goal = love.graphics.newImage("img/goal.png"),
			player = love.graphics.newImage("img/mario.png")
		}
		
	
	for i = 0,3 do
		spritesManager["player" .. tostring(i)] =
			{
				tex = spritesManager.texs.player,
				quad = love.graphics.newQuad(TILE_W * i, 0,
					TILE_W, TILE_H, spritesManager.texs.player:getDimensions())
			}
	end
	spritesManager.wall =
		{
			tex = spritesManager.texs.wall,
			quad = love.graphics.newQuad(0, 0,
				TILE_W, TILE_H, spritesManager.texs.wall:getDimensions())
		}
	spritesManager.box =
		{
			tex = spritesManager.texs.box,
			quad = love.graphics.newQuad(0, 0,
				TILE_W, TILE_H, spritesManager.texs.box:getDimensions())
		}
	spritesManager.box_ok =
		{
			tex = spritesManager.texs.box_ok,
			quad = love.graphics.newQuad(0, 0,
				TILE_W, TILE_H, spritesManager.texs.box_ok:getDimensions())
		}
	spritesManager.goal =
		{
			tex = spritesManager.texs.goal,
			quad = love.graphics.newQuad(0, 0,
				TILE_W, TILE_H, spritesManager.texs.goal:getDimensions())
		}
end

spritesManager.update = function(dt)
	
end

return spritesManager