
require "srcs.global"
require "srcs.matrix"

local gameManager = require("srcs.game_manager")

function love.load()
	love.window.setMode(
		WIN_W,
		WIN_H,
		{
			resizable = false,
			vsync = false,
		})
	gameManager.load()
end

function love.update(dt)
	gameManager.update(dt)
end

function love.keypressed(key)
	gameManager.keypressed(key)
end

function love.draw()
	gameManager.draw()
end
