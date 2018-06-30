
--[[ Programme de bûcheronnage ]]--
function cutting()
    turtle.select(1)
    -- Attend que l'arbre ait poussé --
    local success, data = nil, nil
    success, data = turtle.inspect()
    while data.name == "minecraft:sapling" do
       success, data = turtle.inspect()
    end
    turtle.dig()
    turtle.forward()

    -- Coupe l'arbre sur toute sa hauteur, puis redescend --
    success, data = turtle.inspectUp()
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
end

function planting()
    -- Avance d'un cube, place une pousse d'arbre derrière lui et se repositionne --
    turtle.forward()
    for i = 1, 2 do
        turtle.turnLeft()
    end
    turtle.select(16)
    turtle.place()
    for i = 1, 2 do
        turtle.turnRight()
    end
end


while true do
    -- S'équipe en carburant (charbon de bois) --
    turtle.select(15)
    turtle.turnLeft()
    turtle.suck(4)
    turtle.refuel()
    turtle.turnRight()

    -- S'équipe en pousses d'arbre --
    turtle.select(16)
    suck = turtle.suckDown(8)

    -- Coupe le premier arbre, se positionne pour le parcours... --
    cutting()
    turtle.turnRight()
    planting()

    -- ...Puis coupe les trois segments d'arbres suivants --
    for i = 1, 3 do
        for j = 1, 2 do
            for k = 1, 2 do
                turtle.forward()
            end
            cutting()
            planting()
        end
        turtle.turnRight()
    end

    -- Coupe le dernier segment d'arbres et dépose les bûches dans un coffre --
    for k = 1, 2 do
        turtle.forward()
    end
    cutting()
    planting()
    turtle.turnLeft()
    turtle.forward()
    for i = 1, 16 do
        turtle.select(i)
        if turtle.getItemCount() == 0 then
            break
        end
        turtle.dropDown()
    end
    turtle.select(1)
    turtle.suckDown(4)
    turtle.back()
    turtle.turnRight()
    for k = 1, 2 do
        turtle.forward()
    end
    turtle.up()
    turtle.turnLeft()
    turtle.drop()
    turtle.turnRight()
    turtle.down()
end