-- Example: Keyboard callbacks

function love.load()key = ""
	lastkey = "none"
	keychar = ""
end

-- Keypressed: Called whenever a key was pressed.
function love.keypressed(key)
	lastkey = "pressed"
	keychar = key
end

-- Keyreleased: Called whenever a key was released.
function love.keyreleased(key)
	lastkey = "released"
	keychar = key
end

-- Output if key was pressed/released.
function love.draw()
	love.graphics.print("key: "..lastkey, 100, 100)
	love.graphics.print(keychar,100,120)
end

