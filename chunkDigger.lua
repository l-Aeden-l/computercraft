local args = {...}
local height = tonumber(args[1])  
local direction = "right"

    for i=1,height do
    
        for j=1,8 do

            local function dig()
                for k=1,15 do
                    turtle.dig()
                    local forward = turtle.forward()
                    while not forward do
                        turtle.dig()
                        forward = turtle.forward()
                    end
                end
            end
            dig()
            if direction == "right" then
                turtle.turnRight()
                turtle.dig()
                turtle.forward()
                turtle.turnRight()
            else
                turtle.turnLeft()
                turtle.dig()
                turtle.forward()
                turtle.turnLeft()
            end
            dig()
            if j < 8 then
                if direction == "right" then
                    turtle.turnLeft()
                    turtle.dig()
                    turtle.forward()
                    turtle.turnLeft()
                else
                    turtle.turnRight()
                    turtle.dig()
                    turtle.forward()
                    turtle.turnRight()
                end
            else
                if i < height then
                    turtle.digUp()
                    turtle.up()
                    turtle.turnLeft()
                    turtle.turnLeft()
                    if direction == "right" then
                        direction = "left"
                    else
                       direction = "right" 
                    end
                end
            end

        end
        
    end
    for i=1,height do
        turtle.down()
    end

