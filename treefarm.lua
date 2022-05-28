function checkFuel()
    local fuelLevel = turtle.getFuelLevel()
    if fuelLevel < 20 then 
        turtle.select(1)
        turtle.refuel()
        print("Refueled")
    end
end

function checkTree()
    print("Checking...")
    local success, data = turtle.inspect()
    if data.name == "minecraft:birch_log" then
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
    end
    return false
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
        turtle.down()
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
    switchLine(4)
    turtle.turnRight()
    checkFuel()
end

function switchLine(count)
    for iter = 1,count do
        turtle.forward()
    end
end

function moveToChest()
    print("Moving to Chest")
    turtle.forward()
    turtle.turnLeft()
    for iter = 1,7 do
        turtle.forward()
    end
    turtle.turnRight()    
end

function transferInventory()
    print("Dropping Inventory")
    for inventory = 2,9 do
        turtle.select(inventory)
        turtle.drop()
    end
end

local depth = 15
function runner()
    turtle.forward()
    depth = depth - 1

    turtle.turnLeft()
    tasks()

    turtle.turnRight()
    turtle.turnRight()
    tasks()

    turtle.turnLeft()
end

local chopping = true
while chopping do
    while depth > 0 do
        runner()
    end
    if depth == 0 then
        relocateTurtle()
        depth = 15
    end

    while depth > 0 do
        runner()
    end
    
    moveToChest()
    chopping = false
end