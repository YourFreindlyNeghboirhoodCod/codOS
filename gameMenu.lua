local w,h = term.getSize()

function printCentered (y,s)
    local x = math.floor((w - string.len(s)) /2)
    term.setCursorPos(x,y)
    term.clearLine()
    term.write(s)
end

local nOption = 1

local function drawMenu()
    term.clear()
    term.setCursorPos(1,1)
    term.write(shell.getRunningProgram())
    term.setCursorPos(1,2)
    print("you are on computer #".. os.getComputerID())
    term.setCursorPos(1,3)
    if os.getComputerLabel() == nil then
        term.write("your computer does not have a name")
    else
        term.write("your computer is labeled ".. os.getComputerLabel())
    end
    term.setCursorPos(1,h - 1)
    term.setTextColour(colours.red)
    print("you will not return to the menu once a game is done")
    term.setTextColour(colours.white)

    term.setCursorPos(w-11,1)
    if nOption == 1 then
        term.write("snake")
    elseif nOption == 2 then
        term.write("redirection")
    elseif nOption == 3 then
        term.write("adventure")
    elseif nOption == 4 then
        term.write("main menu")
    end
end

term.clear()
local function drawFrontend()
    printCentered( math.floor(h/2) - 3, "")
    printCentered( math.floor(h/2) - 2, "select game" )
    printCentered( math.floor(h/2) - 1, "")
    printCentered( math.floor(h/2) + 0, ((nOption == 1) and "[ snake ]") or "snake" )
    printCentered( math.floor(h/2) + 1, ((nOption == 2) and "[ redirection ]") or "redirection" )
    printCentered( math.floor(h/2) + 2, ((nOption == 3) and "[ adventure ]") or "adventure" )
    printCentered( math.floor(h/2) + 3, ((nOption == 4) and "[ main menu ]") or "main menu" )
    printCentered( math.floor(h/2) + 4, "")
end

drawMenu()
drawFrontend()

while true do
    local e,p = os.pullEvent("key")
        if p == keys.up  or p == keys.w then
            if nOption > 1 then
                nOption = nOption -1
                drawMenu()
                drawFrontend()
            end
        elseif p == keys.down or p == keys.s then
            if nOption < 4 then
                nOption = nOption + 1
                drawMenu()
                drawFrontend()
            end
        elseif p == keys.enter then
            break
        end
end
term.clear()

--conditions
if nOption == 1 then
    term.setCursorPos(1,1)
    shell.run("worm")
    return
elseif nOption == 2 then
    term.setCursorPos(1,1)
    shell.run("redirection")
    return
elseif nOption == 3 then
    term.setCursorPos(1,1)
    shell.run("adventure")
    return
elseif nOption == 4 then
    shell.run("codOS/menu")
    return
end
