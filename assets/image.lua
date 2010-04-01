-- Example: Loading an Image and displaying it

function love.load()
    icon = love.graphics.newImage("http://love2d.org/logos/love-app-logo-64x64.png")
end

function love.draw()
    love.graphics.draw(icon, 100, 50)
end
