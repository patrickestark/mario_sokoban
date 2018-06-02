
require "srcs.global"

local player = {}

player.dir = DIR_DOWN
player.x = 0
player.y = 0

player.load = function(map)
	p_cnt = 0
	for i = 1, MAP_H do
		for j = 1, MAP_W do
			if map[i][j].tile == "player" then
				p_cnt = p_cnt + 1
				player.x = j
				player.y = i
				map[i][j]:set("empty")
			end
		end
	end
	if p_cnt ~= 1 then
		exitGame()
	end
end

player.update = function(dt)
	
end

return player