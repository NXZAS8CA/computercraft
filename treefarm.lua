function checkFuel()
    local fuelLevel = turtle.getFuelLevel()
    if fuelLevel < 20 then 
        turtle.select(1)
        turtle.refuel()
        print("Refueled")
    end
end

function checkTree()
    print("Cecking...")
    local success, data = turtle.inspect()
    if data.name == "minecraft:brich_log" then
        print("Tree detected")
        return true
    end
    return false
end

function checkSapling()
    print("Checking...")
    local success, data = turtle.inspect()
    if data.name == "minecraft:birch_sapling" then
        print("Sapling detected")
        return true
    else return false 
    end
end

function chopTree()
    print("Chopping...")
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
    checkFuel()
    if checkTree() then
        chopTree()
    end

    turtle.suck()
    turtle.suckUp()
    checkFuel()
end

function relocateTurtle()
    checkFuel()
    turtle.forward()
    turtle.turnRight()
    switchLines(4)
    turtle.turnRight()
    checkFuel()
end

function switchLines(count)
    for iter = 1,count do
        turtle.forward() then
    end
end

local depth = 15
local chopping = true
while chopping do
    turtle.forward()
    depth = depth - 1

     thenturtle.turnLeft()
    tasks()

 then    turtle.turnRight()
    turtle.turnRight()
    tasks()

    turtle.turnLeft()

 then    if depth == 0 then
        relocateTurtle()
        depth = 15
    end
end







