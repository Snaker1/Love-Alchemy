--you do not need to set the size of the world
world = love.physics.newWorld(0,10,true) --gravitation, sleeping

groundBody = love.physics.newBody(world,0,30,"static") --world,x,y,type
groundShapeDef = love.physics.newRectangleShape(groundBody,50,5) --body,width,height
groundfixtureDef = love.physics.newFixture(groundBody,groundShapeDef)

body = love.physics.newBody(world,30,4)
shapeDef = love.physics.newRectangleShape(body,5,5)
fixtureDef= love.physics.newFixture(body,shapeDef)
body.SetMassFromShapes();

function love.update(dt)
	world.Step(dt,10,10)
	world.ClearForces()
end

function love.draw()
	-- do not forget as3.tolua
	love.graphics.rectangle("fill",as3.tolua(body.GetPosition().x),as3.tolua(body.GetPosition().y),10,10)
	love.graphics.rectangle("fill",as3.tolua(groundBody.GetPosition().x),as3.tolua(groundBody.GetPosition().y),100,10)
end
