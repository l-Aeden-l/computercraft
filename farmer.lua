local modem = peripheral.wrap("left")

while true do
    
    local fuel = turtle.getFuelLevel()
    
    if fuel >= 200 then
    
        -- Récolte des carrottes

        local function carrot()
            for i=1,12 do
                turtle.digDown()
                turtle.placeDown()
                turtle.forward()
            end
        end

        carrot()
        for i=1,2 do
            turtle.turnRight()
            turtle.forward()
        end
        carrot()
        turtle.forward()
        turtle.drop()
        for i=1,2 do
            turtle.turnLeft()
            turtle.forward()
        end
        turtle.forward()


        -- Récolte du blé --

        local function wheat()
            for i=1,12 do
                turtle.select(1)
                turtle.digDown()
                local count = turtle.getItemCount(2)
                if count == 0 then
                    turtle.select(16)
                else
                    turtle.select(2)
                end
                turtle.placeDown()
                turtle.forward()
            end
        end

        wheat()
        for i=1,2 do
        turtle.turnRight()
        turtle.forward()
        end
        wheat()
        turtle.select(1)
        turtle.forward()
        turtle.drop()
        turtle.down()
        turtle.forward()
        turtle.select(2)
        turtle.transferTo(16)
        turtle.dropDown()
        turtle.back()
        turtle.turnLeft()
        turtle.forward()
        turtle.forward()
        turtle.up()
        turtle.turnLeft()
        for i=1,14 do
           turtle.forward() 
        end
        turtle.turnRight()
        turtle.forward()
        turtle.turnRight()
        for i=1,12 do
            turtle.forward()
        end
        turtle.turnLeft()
        turtle.forward()
        turtle.turnLeft()

        -- Récolte des patates --

        local function potato()
            for i=1,12 do
                turtle.digDown()
                local details = turtle.getItemDetail(1)
                if details.name == "minecraft:poisonous_potato" then
                    turtle.select(2)
                end
                turtle.placeDown()
                turtle.forward()
            end
        end

        turtle.select(1)
        potato()
        for i=1,2 do
            turtle.turnRight()
            turtle.forward()
        end
        potato()
        turtle.forward()
        turtle.drop()
        turtle.down()
        turtle.forward()
        for i=1,2 do
            turtle.select(i)
            turtle.dropDown()
        end
        turtle.back()
        turtle.turnLeft()
        turtle.forward()
        turtle.up()
        turtle.up()
        turtle.turnLeft()
        turtle.forward()

        -- Récolte Cannes à sucre --

        local function sugarCane()
            for i=1,12 do
                turtle.dig()
                turtle.forward()
            end
        end

        turtle.select(1)
        sugarCane()
        turtle.forward()
        turtle.down()
        turtle.turnRight()
        turtle.turnRight()
        sugarCane()
        turtle.forward()
        turtle.forward()
        turtle.drop()
        turtle.turnRight()
        for i=1,9 do
            turtle.forward()
        end
        turtle.turnRight()
        turtle.forward()
        turtle.forward()
        
        modem.transmit(5,1,fuel)
        
        sleep(3600)
    else
       print("Pas assez de fioul") 
    end
    
end