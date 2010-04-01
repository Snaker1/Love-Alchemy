function love.load()
	g = love.graphics
	pos = {}
	pos.x = 160
	pos.y = 304
	body = {{0,0}}
	lenght = 3
	angle = 0
	dsize = 16 
	pause = true
	fruit_pos = {math.random(1,18)*16, math.random(1,18)*16}
	g.setFont(12)
	canvas.height = 320
	canvas.width = 320
	g.setBackgroundColor(0,0,0)
end
function love.keypressed(key)
if key=="up" or key=="w" then
		if angle ~= 180 then
			angle = 0
		end
		pause = false
	elseif key=="left" or key=="a" then 
		if angle ~= 90 then
			angle = 270
		end
		pause = false
	elseif key=="down" or key=="s" then
		if angle ~= 0 then
			angle = 180
		end
		pause = false
	elseif key=="right" or key=="d" then
		if angle ~= 270 then
			angle = 90
		end
		pause = false
	elseif  key=="p" then
		pause = true
	elseif key =="escape" then
		love.load()
	end
	
end
	
function love.update(dt)
	if not pause then
		table.insert(body,1,{pos.x,pos.y})
		table.remove (body,lenght)
		if angle == 0 then
			pos.y = pos.y  - dsize 
		end
		if angle == 270 then 
			pos.x = pos.x - dsize 
		end
		if angle == 180 then
			pos.y = pos.y + dsize 
		end
		if angle == 90 then
			pos.x = pos.x + dsize 
		end
	
		if pos.x  >= 320 or pos.x < 0 or
			pos.y >= 320  or pos.y < 0 then
			love.load()
		end
		if pos.x  == fruit_pos[1] and pos.y == fruit_pos[2] then 
			fruit_pos = {math.random(1,18)*16, math.random(1,18)*16}
			lenght = lenght + 1
		end
		for i = 1, #body  do 
			if pos.x == body[i][1] and pos.y == body[i][2]  then
			love.load()
			end
		end
	end
	love.timer.sleep(300)
end

function love.draw()
	g.setColor(250, 250, 250)
	g.print(lenght-3, 0,0)
	g.setColor(0, 200, 0)
	g.rectangle("line",pos.x, pos.y,dsize,dsize)
	g.setColor(0, 125, 0)
	for i = 1, #body , 1 do
		g.rectangle("line",body[i][1],body[i][2],dsize,dsize)
	end
	g.setColor(200, 0, 0)
	g.rectangle("line",fruit_pos[1],fruit_pos[2],dsize,dsize)
end
