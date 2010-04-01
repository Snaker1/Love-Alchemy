function love.load()
	g = love.graphics
	pos = {160,304}
	body = {{0,0}}
	lenght = 3
	angle = 0
	dsize = 16 
	alive = true
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
		table.insert(body,1,{pos[1],pos[2]})
		table.remove (body,lenght)
		if angle == 0 then
			pos[2] = pos[2]  - dsize 
		end
		if angle == 270 then 
			pos[1] = pos[1] - dsize 
		end
		if angle == 180 then
			pos[2] = pos[2] + dsize 
		end
		if angle == 90 then
			pos[1] = pos[1] + dsize 
		end
	
		if pos[1]  >= 320 or pos[1] < 0 or
			pos[2] >= 320  or pos[2] < 0 then
			love.load()
		end
		if pos[1]  == fruit_pos[1] and pos[2] == fruit_pos[2] then 
			fruit_pos = {math.random(1,18)*16, math.random(1,18)*16}
			lenght = lenght + 1
		end
		for i = 1, #body  do 
			if pos[1] == body[i][1] and pos[2] == body[i][2]  then
			love.load()
			end
		end
	end
	if not alive then
		love.load()
	end	
end

function love.draw()
	g.setColor(250, 250, 250)
	g.print(lenght-3, 0,0)
	g.setColor(0, 200, 0)
	g.rectangle("line",pos[1], pos[2],dsize,dsize)
	g.setColor(0, 125, 0)
	for i = 1, #body , 1 do
		g.rectangle("line",body[i][1],body[i][2],dsize,dsize)
	end
	g.setColor(200, 0, 0)
	g.rectangle("line",fruit_pos[1],fruit_pos[2],dsize,dsize)
end
