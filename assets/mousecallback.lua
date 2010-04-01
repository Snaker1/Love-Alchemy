-- Example: Mouse callbacks

-- Mousepressed: Called whenever a mouse button was pressed,
-- passing the button and the x and y coordiante it was pressed at.
function love.mousepressed(x, y, button)
	-- Checks which button was pressed.
	if button == "l" then
		last = "left pressed"
	end
end

-- Mousereleased: Called whenever a mouse button was released,
-- passing the button and the x and y coordiante it was released at.
function love.mousereleased(x, y, button)
	-- Checks which button was released.
	if button == "l" then
		last = "left released"
	end
end

function love.load()
	last = "nothing"
end

-- Output the last mouse button which was pressed/released.
function love.draw()
	love.graphics.print("Last mouse click: " .. last, 100, 100)
end
