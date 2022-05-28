function checkFuel()
    local fuelLevel = turtle.getFuelLevel()
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
    if data.name == "minecraft:birch_sapling" then
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

function relocateTurtle()
    checkFuel()
    turtle.forward()
    turtle.turnRight()
    switchLines(4)
    turtle.turnRight()
    checkFuel()
end

function switchLines(count)
    for iter = 1, count do
        turtle.forward()
    end
end

function transferInventory()
    print("Dropping inventory")
    for inventory = 2,9 do
        turtle.select(inventory)
        turtle.drop()
    end
end

function moveToChest()
    turtle.forward()
    turtle.turnLeft()
    for iter = 1, 7 do
        turtle.forward()
    end
    turtle.turnRight()
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

local depth = 15
function runner()
    turtle.forward()
    depth = depth - 1
    
    turtle.turnLeft()
    
    if checkTree() then
        chopTree()
    end
    --tasks()
    
    turtle.turnRight()
    turtle.turnRight()
    tasks()
    
    turtle.turnLeft()
end

local chopping = true
while chopping do
    runner()
    
    
    --while depth > 0 do
    --    runner()
    --end

    --if depth == 0 then
    --    relocateTurtle()
    --    depth = 15
    --end

    --while depth > 0 do
    --    runner()
    --end
    --moveToChest()
    --transferInventory()
    --chopping = false
end







