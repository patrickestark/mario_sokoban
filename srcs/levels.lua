
require "srcs.global"

local levels = {}

levels.gameLvl = nil
levels.editorLvl = nil
levels.sLvls = {}

levels.load = function()
	levels.gameLvl = love.filesystem.newFile("lvls/game.level")
	
	if levels.gameLvl:open("r") == false then
		exitGame()
	end
	
	for line in levels.gameLvl:lines() do
		table.insert(levels.sLvls, line)
	end
	
	levels.gameLvl:close()
end

levels.openLevel = function(map, lvltype, lvl)
	for i = 1, MAP_H do
		for j = 1, MAP_W do
			c = levels.sLvls[lvl]:byte((i - 1) * MAP_H + (j))
			c = string.char(c)
			if c == "0" then
				map[i][j]:set("empty")
			elseif c == "1" then
				map[i][j]:set("wall")
			elseif c == "2" then
				map[i][j]:set("box")
			elseif c == "3" then
				map[i][j]:set("box_ok")
			elseif c == "4" then
				map[i][j]:set("goal")
			elseif c == "5" then
				map[i][j]:set("player")
			else
				return 0
			end
		end
	end
	
	return map
end

return levels