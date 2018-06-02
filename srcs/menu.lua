
require "srcs.global"

local menu = {}

menu.load = function()
	
end

menu.poke = function()
	
end

menu.update = function(dt)
	if love.keyboard.isDown("escape") then
		gameState = "exit"
	end
end

menu.keypressed = function(key)
	
end

menu.draw = function()
	love.graphics.rectangle("fill", 50, 50, 50, 50)
end

return menu