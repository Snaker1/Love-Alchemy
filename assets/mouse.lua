-- Example: Getting the x- and y-position of the mouse

function love.load()
    love.graphics.setFont(14)
end

function love.draw()
    -- Draws the position on screen.
    love.graphics.print("The mouse is at:",50,50)
	love.graphics.print(love.mouse.getX(),50,64)
	love.graphics.print(love.mouse.getY(),50,78)
end
