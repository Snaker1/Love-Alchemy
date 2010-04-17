-- This file gets executed before your game runs

love.physics = {}
function love.physics.newWorld(xg,yg,sleep)
	return as3.class.Box2D.Dynamics.b2World.new(
		as3.class.Box2D.Common.Math.b2Vec2.new(xg or 0,yg or 0),sleep or true)
end
function love.physics.newBody(world,x,y,type)
	local body = as3.class.Box2D.Dynamics.b2BodyDef.new()
	body.position.Set(x,y)
	if type == "static" then
		body.type=as3.class.Box2D.Dynamics.b2Body.b2_staticBody
	elseif type == "kinematic" then
		body.type=as3.class.Box2D.Dynamics.b2Body.b2_kinematicBody
	else
		body.type=as3.class.Box2D.Dynamics.b2Body.b2_dynamicBody
	end
	return world.CreateBody(body)
end
function love.physics.newCircleShape(body,radius) 
	local shape = as3.class.Box2D.Collision.Shapes.b2CircleShape.new(radius)
	body.CreateShape(shape)
	return shape
end
function love.physics.newRectangleShape(body,w,h)
	local shape = as3.class.Box2D.Collision.Shapes.b2PolygonShape.new();
	shape.SetAsBox(w, h)
	body.CreateShape(shape)
	return shape
end
function love.physics.newPolygonShape(body)
	local shape = as3.class.Box2D.Collision.Shapes.b2PolygonShape.new();
	body.CreateShape(shape)
	return shape
end
function love.physics.newFixture(body,shape,density)
	local fixture = as3.class.Box2D.Dynamics.b2FixtureDef.new()
	fixture.density = density or 1
	fixture.shape = shape
	return body.CreateFixture(fixture);
end
function love.physics.newMouseJoint()
	local joint = as3.class.Box2D.Dynamics.Joints.b2MouseJointDef.new()
	return joint
end
function love.physics.newDistanceJoint(body1,body2,x1,y1,x2,y2)
	local joint = as3.class.Box2D.Dynamics.Joints.b2DistanceJointDef.new()
	joint.Initialize(body1, body2, as3.class.Box2D.Common.Math.b2Vec2.new(x1,y2),
		as3.class.Box2D.Common.Math.b2Vec2.new(x2,y2));
	return joint
end
function love.physics.newGearJoint(body1,body2,ratio)
	local joint = as3.class.Box2D.Dynamics.Joints.b2GearJointDef.new()
	joint.body1 = body1
	joint.body2 = body2
	jointDef.ratio = ratio
	return joint
end
function love.physics.newPulleyJoint(body1,body2,gx1,gy1,gx2,gy2,x1,y1,x2,y2,ratio)
	local joint = as3.class.Box2D.Dynamics.Joints.b2PulleyJointDef.new()
	joint.Initialize(body1,body2,as3.class.Box2D.Common.Math.b2Vec2.new(gx1,gy2),
		as3.class.Box2D.Common.Math.b2Vec2.new(gx2,gy2),
		as3.class.Box2D.Common.Math.b2Vec2.new(x1,y1),
		as3.class.Box2D.Common.Math.b2Vec2.new(x2,y2),ratio);
	return joint
end
function love.physics.newRevoluteJoint(body1, body2, x, y )
	local joint = as3.class.Box2D.Dynamics.Joints.b2RevoluteJointDef.new()
	joint.Initialize(body1,body2,as3.class.Box2D.Common.Math.b2Vec2.new(x,y))
	return joint
end


