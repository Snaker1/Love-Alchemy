-- Example: Keyboard callbacks

function love.load()
	lastkey = "nothing"
end

-- Keypressed: Called whenever a key was pressed.
function love.keypressed(key)
	lastkey = key .. " pressed"
end

-- Keyreleased: Called whenever a key was released.
function love.keyreleased(key)
	lastkey = key .. " released"
end

-- Output the last mouse button which was pressed/released.
function love.draw()
	love.graphics.print("Last key: " .. lastkey, 100, 100)
end
