-- This file gets executed before your game runs

canvas.framerate = 30
love = {}
love.audio = {}
love.filesystem = {}
love.graphics = {}
	function love.graphics.setFont(size)
		love.fontsize = size
	end
	function love.graphics.setColor(red,green,blue)
		color = "0x"..string.format("%x",red)..string.format("%x",green)..string.format("%x",blue)
	end
	function love.graphics.setBackgroundColor(red, green, blue)
		local bgcolor = "0x"..string.format("%x",red)..string.format("%x",green)..string.format("%x",blue)
		canvas.setStyle("backgroundColor",bgcolor)
	end
	function love.graphics.newImage(source)
		local image = as3.class.mx.controls.Image.new()
		image.source = source
		table.insert(love.imagesloadet,image)
		return #love.imagesloadet
	end
	function love.graphics.draw(source,x,y,rotation,sx,sy)
			local image = love.imagesloadet[source]
			image.x = x
			image.y = y
			image.maintainAspectRatio="false"
			if sx then image.width = sx end
			if sy then image.height = sy end
			canvas.addChild(image)
	end
	function love.graphics.print(text,x,y)
		local label = as3.class.mx.controls.Label.new()
		label.text = text
		label.x = x
		label.y = y
		label.setStyle("color", color); 
		label.setStyle("fontSize",love.fontsize)
		canvas.addChild(label)
	end
	function love.graphics.printf(text,x,y,limit,align)
		local label = as3.class.mx.controls.Text.new()
		label.text = text
		label.x = x
		label.y = y
		label.width = limit
		label.setStyle("textAlign",align)
		label.setStyle("fontSize",fontsize)
		label.setStyle("color", color); 
		canvas.addChild(label)
	end
	function love.graphics.rectangle(mode,x,y,width,height)
		local box = as3.class.mx.containers.Canvas.new()
		box.width = width
		box.height = height
		box.x, box.y = x,y
		if mode == "fill" then 
			box.setStyle("backgroundColor",color)
		else
			box.setStyle("borderColor",color)
			box.setStyle("borderStyle","solid")
		end
		canvas.addChild(box)
	end
	function love.graphics.getColor()
		return color -- returns color in hex
	end
	function love.graphics.getWidth()
		return canvas.width
	end
	function love.graphics.getHeight()
		return canvas.height
	end
love.image = {}
love.joystick = {}
love.keyboard = {}
	function love.keyboard.isDown( key )
		return love.keyDown
	end
love.mouse = {}
	function love.mouse.getX()
		return canvas.mouseX
	end
	function love.mouse.getY()
		return canvas.mouseY
	end
love.physics = {}
love.sound = {}
love.timer = {}
function love.timer.getMicroTime()
	return as3.tolua(as3.namespace.flash.utils.getTimer())
end
function love.timer.getTime()
	local time = as3.tolua(love.timer.getMicroTime())/1000
	return time
end

love.imagesloadet = {}
love.keyDown = false

function love.mousepressed(x,y,button) end
function love.mousereleased(x,y,button) end
function love.keypressed() end
function love.keyreleased() end

love.callback = {} 
function love.callback.mousepressed()
	love.mousepressed(canvas.mouseX,canvas.mousey,"l")
end
function love.callback.mousereleased()
	love.mousereleased(canvas.mouseX,canvas.mousey,"l")
end
function love.callback.keypressed(event)
	love.keyDown = string.char(as3.tolua(event.charCode))
	love.keypressed(love.keyDown)
end
function love.callback.keyreleased(event)
	love.keyDown = string.char(as3.tolua(event.charCode))
	love.keyreleased(love.keyDown) 
end
 
love.fontsize = 12
color = "0x000000"

function love.refresh() 
	canvas.removeAllChildren()
	if love.update then love.update(0.03) end
	if love.draw then love.draw() end
end

function love.run()
	if love.load then love.load() end
	canvas.addEventListener(as3.class.flash.events.Event.ENTER_FRAME, love.refresh)
	canvas.addEventListener(as3.class.flash.events.MouseEvent.MOUSE_DOWN,love.callback.mousepressed);
	canvas.addEventListener(as3.class.flash.events.MouseEvent.MOUSE_UP,love.callback.mousereleased);
	stage.addEventListener(as3.class.flash.events.KeyboardEvent.KEY_DOWN, love.callback.keypressed);
	stage.addEventListener(as3.class.flash.events.KeyboardEvent.KEY_UP, love.callback.keyreleased);
end

