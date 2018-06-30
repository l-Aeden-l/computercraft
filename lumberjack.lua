function plein()
   for i = 3,16 do 
   turtle.select(i)
   turtle.refuel(1)
   end 
end 

while true do
    local success, data = nil, nil
    turtle.select(16)
    success, data = turtle.inspect()
    while data.name == "minecraft:sapling" do
       success, data = turtle.inspect()
    end
    turtle.dig()
    if turtle.getFuelLevel() < 32 then plein() end
    turtle.forward()
    while data.name == "minecraft:log" do
        turtle.digUp()
        turtle.up()
        success, data = turtle.inspectUp()
    end
    success, data = turtle.inspectDown()
    while not success do
        turtle.down()
        success, data = turtle.inspectDown()
    end
    turtle.back()
    local logs = turtle.getItemCount(16)
    if logs >=6 then
        local detail = turtle.getItemDetail(2)
        if detail then
            turtle.select(2)
            turtle.drop()
        end
        turtle.select(4) -- Sélectionne le slot 3
        turtle.craft(1) -- Craft 1 bûche (=> 4 planches)
        turtle.turnRight()
        turtle.turnRight()
        for i = 1, 7 do
            turtle.forward()
        end
        turtle.up()
        turtle.select(16)
        turtle.drop(5)
        turtle.down()
        turtle.turnLeft()
        turtle.forward()
        turtle.turnRight()
        turtle.select(4)
        turtle.drop()
        turtle.turnRight()
        turtle.forward()
        turtle.turnLeft()
        turtle.down()
        turtle.down()
        -- Récupération d'un charbon et refuel
        turtle.select(13)
        local suck = turtle.suck(1)
        if suck then
            turtle.refuel()
        end
        turtle.turnRight()
        turtle.turnRight()
        turtle.forward()
        turtle.forward()

        turtle.select(2)
        local saplingCount = turtle.getItemCount()
        if saplingCount < 2 then
            local missingSapling = 2 - saplingCount
            suck = turtle.suckDown(missingSapling)
        end
        turtle.up()
        turtle.up()
        for i = 1, 5 do
            turtle.forward()
        end
    end
    turtle.select(2)
    turtle.place()
end