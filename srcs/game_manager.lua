
local menu = require("srcs.menu")
local game = require("srcs.game")
local spritesManager = require("srcs.sprites_manager")
local levels = require("srcs.levels")

local gameManager = {}

gameManager.lastState = ""

gameManager.load = function()
	spritesManager.load()
	levels.load()
	menu.load()
	game.load()
end

gameManager.update = function(dt)
	spritesManager.update(dt)
	if gameManager.lastState ~= gameState then
		gameManager.lastState = gameState
		
		if gameState == "menu" then
			menu.poke()
		elseif gameState == "game" then
			game.poke()
		elseif gameState == "exit" then
			exitGame()
		end
	end
	if gameState == "menu" then
		menu.update(dt)
	elseif gameState == "game" then
		game.update(dt)
	end
end

gameManager.keypressed = function(key)
	if (gameState == "menu") then
		menu.keypressed(key)
	elseif gameState == "game" then
		game.keypressed(key)
	end
end

gameManager.draw = function()
	if gameState == "menu" then
		menu.draw()
	elseif gameState == "game" then
		game.draw()
	end
end

gameManager.changeState = function(newState)
	gameState = newState
end

return gameManager