-- This file gets executed before your game runs

canvas.framerate = 30
print = as3.makeprinter(output)
love = {}
love.recycle = {}
love.recycle.pos = {}
love.recycle.label = {}
love.recycle.pos.label = 0
love.recycle.text = {}
love.recycle.pos.text = 0
love.recycle.rect = {}
love.recycle.pos.rect = 0
love.recycle.draw = {}
love.recycle.pos.draw = 0
function love.recycle.clear(object,pos)
	if #object > pos then
		canvasText.removeChild(object[#object])
		table.remove(object)
	end 
	pos = 0
end
 
canvasText = as3.class.mx.containers.Canvas.new()
canvasEtc = as3.class.mx.containers.Canvas.new()
canvas.addChild(canvasText)
canvas.addChild(canvasEtc)

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
	function love.graphics.draw(source,x,y,rotation,sx,sy,ox,oy)
		local image = love.imagesloadet[source]
		if rotation then image.rotation = rotation end
		if ox and oy then	
			local rad_angle = rotation * (3.1415926 / 180) 
			local xoff = math.cos(rad_angle) * (x- (x+ox)) - math.sin(rad_angle) * (y-(y+oy))+ox
			local yoff = math.sin(rad_angle) * (x-(x+ox)) + math.cos(rad_angle) * (y-(y+oy))+ox
			image.x =  x + xoff
			image.y = y + yoff
		else 
			image.x = x
			image.y = y
		end
			image.maintainAspectRatio="false"
			if sx then image.width = sx end
			if sy then image.height = sy end
			canvasEtc.addChild(image)
	end
	function love.graphics.print(text,x,y)
		love.recycle.pos.label = love.recycle.pos.label + 1
		if not (#love.recycle.label > love.recycle.pos.label) then
			local label = as3.class.mx.controls.Label.new()
			table.insert(love.recycle.label,label)
			canvasText.addChild(love.recycle.label[love.recycle.pos.label])
		end
		local label = love.recycle.label[love.recycle.pos.label]
		label.text = text
		label.x = x
		label.y = y
		label.setStyle("color", color);
		label.setStyle("fontSize",love.fontsize)
	end
	function love.graphics.printf(text,x,y,limit,align)
		love.recycle.pos.text = love.recycle.pos.text + 1
		if #love.recycle.text <  love.recycle.pos.text then
			local text = as3.class.mx.controls.Text.new()
			table.insert(love.recycle.text,text)
			canvasText.addChild(love.recycle.text[love.recycle.pos.text])
		end
		local text = love.recycle.text[love.recycle.pos.text]
		text.text = text
		text.x = x
		text.y = y
		if limit then
			text.width = limit
		end
		text.setStyle("textAlign",align)
		text.setStyle("fontSize",fontsize)
		text.setStyle("color", color);
	end
	function love.graphics.rectangle(mode,x,y,width,height)
		love.recycle.pos.rect = love.recycle.pos.rect + 1
		if #love.recycle.rect <  love.recycle.pos.rect then
			local rect = as3.class.mx.containers.Canvas.new()
			table.insert(love.recycle.rect,rect)
			canvasText.addChild(love.recycle.rect[love.recycle.pos.rect])
		end
		local rect = love.recycle.rect[love.recycle.pos.rect]
		rect.width = width
		rect.height = height
		rect.x, rect.y = x,y
		if mode == "fill" then
			rect.setStyle("backgroundColor",color)
		else
			rect.setStyle("borderColor",color)
			rect.setStyle("borderStyle","solid")
		end
	end
	function love.graphics.getColor()
		return tonumber(string.sub(color,3,4),16),
			tonumber(string.sub(color,5,6),16),
			tonumber(string.sub(color,7,8),16)
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
	function love.keyboard.getKey(keyCode,charCode)
		local key = ""
		if keyCode == 37 then
			key = "left"
		elseif keyCode == 38 then
			key = "up"
		elseif keyCode == 39 then
			key = "right"
		elseif keyCode == 40 then
			key = "down"
		elseif keyCode == 18 then
			keyCode = "lalt"
		elseif keyCode == 8 then
			key = "backspace"
		elseif keyCode == 20 then
			key = "capslock"
		elseif keyCode == 17 then
			key = "lctrl"
		elseif keyCode == 46 then
			key = "delete"
		elseif keyCode == 13 then
			key = "return"
		elseif keyCode == 27 then
			key = "escape"
		elseif keyCode >= 112 and keyCode <= 123 then
			key = "f"..(keyCode - 111)
		elseif keyCode == 45 then
			key = "insert"
		elseif keyCode == 16 then
			key = "lshift"
		elseif keyCode == 9 then
			key = "tab"
		else
			key = string.char(charCode)
		end
		return key
	end

	function love.keyboard.isDown( key )
		 for i, v in ipairs(love.keyDown) do 
			if v == key then
				return true
			end
		end
	end
love.mouse = {}
	function love.mouse.getX()
		return canvas.mouseX
	end
	function love.mouse.getY()
		return canvas.mouseY
	end
	function love.mouse.setVisible(visible)
		if visible then
			as3.class.flash.ui.Mouse.show()
		else	
			as3.class.flash.ui.Mouse.hide()
		end
	end
love.physics = {}
love.sound = {}
love.timer = {}
function love.timer.getMicroTime()
	return as3.tolua(as3.namespace.flash.utils.getTimer())
end
function love.timer.getTime()
	local time = as3.tolua(as3.namespace.flash.utils.getTimer())/1000
	return time
end
function love.timer.sleep(sleep)
	function love.refresh() end
	as3.namespace.flash.utils.setTimeout(love.timer.resume,sleep)
end
function love.timer.resume()
	love.refresh = love.dorefresh()
end

love.imagesloadet = {}


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
local charCode = tonumber(as3.tolua(event.charCode) )
local keyCode = tonumber(as3.tolua(event.keyCode))
local keyDown = love.keyboard.getKey(keyCode,charCode)

	love.keypressed(keyDown)
	table.insert(love.keyDown,keyDown)
end
function love.callback.keyreleased(event)
	local charCode = tonumber(as3.tolua(event.charCode) )
	local keyCode = tonumber(as3.tolua(event.keyCode))
	local keyDown = love.keyboard.getKey(keyCode,charCode)
	love.keyreleased(keyDown)
	 for i, v in ipairs(love.keyDown) do 
		if v == keyDown then
			table.remove(love.keyDown,i)
		end
	end
end
 
love.fontsize = 12
color = "0x000000"

function love.dorefresh()
	local newtime = as3.tolua(as3.namespace.flash.utils.getTimer())
	delta = (newtime - oldtime)/1000 
	oldtime = newtime
	canvasEtc.removeAllChildren()
	if love.update then love.update(delta) end
	if love.draw then love.draw() end
	
	love.recycle.clear(love.recycle.label,love.recycle.pos.label)
	love.recycle.clear(love.recycle.text,love.recycle.pos.text)
	love.recycle.clear(love.recycle.rect,love.recycle.pos.rect)
	love.recycle.pos.label = 0
	love.recycle.pos.text = 0
	love.recycle.pos.rect = 0
	collectgarbage("collect")
end
function love.enterFrame()
	as3.namespace.flash.utils.setTimeout(love.refresh,1) -- sleep 1 ms
end

function love.run()
	if love.load then love.load() end
	oldtime = 0
	love.refresh = love.dorefresh
	canvas.addEventListener(as3.class.flash.events.Event.ENTER_FRAME, love.enterFrame)
	canvas.addEventListener(as3.class.flash.events.MouseEvent.MOUSE_DOWN,love.callback.mousepressed);
	canvas.addEventListener(as3.class.flash.events.MouseEvent.MOUSE_UP,love.callback.mousereleased);
	stage.addEventListener(as3.class.flash.events.KeyboardEvent.KEY_DOWN, love.callback.keypressed);
	stage.addEventListener(as3.class.flash.events.KeyboardEvent.KEY_UP, love.callback.keyreleased);
end

love.keyDown = {}
as3.onclose(
  function(e)
	canvas.removeAllChildren()
	flash.ui.Mouse.show()
	canvas.removeEventListener(as3.class.flash.events.Event.ENTER_FRAME, love.enterFrame)
	canvas.removeEventListener(as3.class.flash.events.MouseEvent.MOUSE_DOWN,love.callback.mousepressed);
	canvas.removeEventListener(as3.class.flash.events.MouseEvent.MOUSE_UP,love.callback.mousereleased);
	stage.removeEventListener(as3.class.flash.events.KeyboardEvent.KEY_DOWN, love.callback.keypressed);
	stage.removeEventListener(as3.class.flash.events.KeyboardEvent.KEY_UP, love.callback.keyreleased);
end)




