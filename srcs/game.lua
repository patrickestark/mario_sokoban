
require "srcs.global"

local spritesManager = require("srcs.sprites_manager")
local player = require("srcs.player")
local levels = require("srcs.levels")

local game = {}

game.map = new_matrix(MAP_W, MAP_H, 
	{
		tile = "empty", 
		isEmpty = true,
		set = function(self, val)
			self.tile = val
			if val == "empty" or val == "goal" then
				self.isEmpty = true
			else
				self.isEmpty = false
			end
		end
	})

game.load = function()
	game.map[3][2]:set("goal")
	game.map[9][2]:set("player")
	game.map[4][2]:set("box")
	game.map[6][2]:set("box")
	game.map[1][1]:set("wall")
	game.map[7][8]:set("wall")
	
	game.map = levels.openLevel(game.map, 1, 1)
	player.load(game.map)
end

game.poke = function()
	
end

game.movePlayer = function(dir, dt)
	player.dir = dir
	lastPos = {x = player.x, y = player.y}
	if dir == DIR_UP then
		if player.y - 1 < 1 then
			return 0
		end
		if game.map[player.y - 1][player.x].isEmpty == true then
			player.y = player.y - 1
		elseif game.map[player.y - 1][player.x].tile == "box" then
			if player.y - 2 < 1 then
				return 0
			end
			if game.map[player.y - 2][player.x].isEmpty == true then
				game.map[player.y - 1][player.x]:set("empty")
				if game.map[player.y - 2][player.x].tile == "goal" then
					game.map[player.y - 2][player.x]:set("box_ok")
				else
					game.map[player.y - 2][player.x]:set("box")
				end
				player.y = player.y - 1
			end
		end
	elseif dir == DIR_DOWN then
		if player.y + 1 > MAP_H then
			return 0
		end
		if game.map[player.y + 1][player.x].isEmpty == true then
			player.y = player.y + 1
		elseif game.map[player.y + 1][player.x].tile == "box" then
			if player.y + 2 > MAP_H then
				return 0
			end
			if game.map[player.y + 2][player.x].isEmpty == true then
				game.map[player.y + 1][player.x]:set("empty")
				if game.map[player.y + 2][player.x].tile == "goal" then
					game.map[player.y + 2][player.x]:set("box_ok")
				else
					game.map[player.y + 2][player.x]:set("box")
				end
				player.y = player.y + 1
			end
		end
	elseif dir == DIR_LEFT then
		if player.x - 1 < 1 then
			return 0
		end
		if game.map[player.y][player.x - 1].isEmpty == true then
			player.x = player.x - 1
		elseif game.map[player.y][player.x - 1].tile == "box" then
			if player.x - 2 < 1 then
				return 0
			end
			if game.map[player.y][player.x - 2].isEmpty == true then
				game.map[player.y][player.x - 1]:set("empty")
				if game.map[player.y][player.x - 2].tile == "goal" then
					game.map[player.y][player.x - 2]:set("box_ok")
				else
					game.map[player.y][player.x - 2]:set("box")
				end
				player.x = player.x - 1
			end
		end
	elseif dir == DIR_RIGHT then
		if player.x + 1 > MAP_W then
			return 0
		end
		if game.map[player.y][player.x + 1].isEmpty == true then
			player.x = player.x + 1
		elseif game.map[player.y][player.x + 1].tile == "box" then
			if player.x + 2 > MAP_W then
				return 0
			end
			if game.map[player.y][player.x + 2].isEmpty == true then
				game.map[player.y][player.x + 1]:set("empty")
				if game.map[player.y][player.x + 2].tile == "goal" then
					game.map[player.y][player.x + 2]:set("box_ok")
				else
					game.map[player.y][player.x + 2]:set("box")
				end
				player.x = player.x + 1
			end
		end
	else
		return 0
	end
end

game.update = function(dt)
	player.update(dt)
end

game.keypressed = function(key)
	if key == "w" then
		game.movePlayer(DIR_UP, dt)
	end
	if key == "s" then
		game.movePlayer(DIR_DOWN, dt)
	end
	if key == "a" then
		game.movePlayer(DIR_LEFT, dt)
	end
	if key == "d" then
		game.movePlayer(DIR_RIGHT, dt)
	end
end

game.draw = function()
	love.graphics.clear(1.00, 0.98, 0.94)
	for i = 1, MAP_H do
		for j = 1, MAP_W do
			if game.map[i][j].tile ~= "empty" then
				love.graphics.draw(
					spritesManager[game.map[i][j].tile].tex,
					spritesManager[game.map[i][j].tile].quad, 
					(j - 1) * TILE_W, (i - 1) * TILE_H)
			end
		end
	end
	love.graphics.draw(
		spritesManager["player" .. tostring(player.dir)].tex,
		spritesManager["player" .. tostring(player.dir)].quad, 
		(player.x - 1) * TILE_W, (player.y - 1) * TILE_H)
end

return game