function fuelCheck()
    local fuelLevel = turtle.getFuelLevl()
    if fuelLevel < 20 then 
        turtle.select(1)
        turtle.refuel()
        print("Refueled")
    end
end

function checkTree()
    local success, data = turtle.inspect()
    if data.name == "minecraft:brich_log" then
        print("Tree detected")
        return true
    end
    return false
end

function checkSapling()
    local success, data = turtle.inspect()
    if data.name == "minecraft:birch_sapling"
        print("Sapling detected")
        return true
    else return false 
    end
end

function chopTree()
    print("Chopping")
    turtle.dig()
    turtle.forward()
    while turtle.detectUp() == true do
        turtle.digUp()
        turtle.up()
    end
    while turtle.detectDown() == false do
        tur.down()
    end
    turtle.back()
end

function setSapling()
    print("Placing Sapling")
    turtle.select(3)
    turtle.place()
    turtle.select(1)
end

function tasks()
    fuelCheck()
    if checkTree() then
        chopTree()
    end

    turtle.suck()
    turtle.suckUp()
    fuelCheck()
end

function relocateTurtle()
    fuelCheck()
    turtle.forward()
    turtle.turnRight()
    switchLines()
    turtle.turnRight()
    fuelCheck()
end

function switchLines()
    turtle.forward()
    turtle.forward()
    turtle.forward()
    turtle.forward()
end

local depth = 15
local chopping = true
while chopping do
    turtle.forward()
    depth = depth - 1

    turtle.turnLeft()
    tasks()

    turtle.turnRight()
    turtle.turnRight()
    tasks()

    turtle.turnLeft()

    if depth == 0 then
        relocateTurtle()
        depth = 15
    end
end








