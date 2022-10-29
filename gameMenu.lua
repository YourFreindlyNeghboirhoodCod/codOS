os.pullEvent = os.pullEventRaw

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
    term.write("-codOS game menu-")
    term.setCursorPos(1,3)
    term.setTextColour(colours.red)
    print("if you exit a game, you will be in the command prompt")
    term.setTextColour(colours.white)

    term.setCursorPos(w-11,1)
    if nOption == 1 then
        term.write("snake")
    elseif nOption == 2 then
        term.write("redirection")
    elseif nOption == 3 then
        term.write("adventure")
    elseif nOPtion == 4 then
        term.write("back to menu")
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
    printCentered( math.floor(h/2) + 3, ((nOption == 4) and "[ back to menu ]") or "back to menu" )
    printCentered( math.floor(h/2) + 4, "")
end

drawMenu()
drawFrontend()

while true do
    local e,p = os.pullEvent("key")
        if p == keys.up then
            if nOption > 1 then
                nOption = nOption -1
                drawMenu()
                drawFrontend()
            end
        elseif p == keys.down then
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

if nOption == 1 then
    shell.run("worm")
elseif nOption == 2 then
    shell.run("redirection")
elseif nOption == 3 then
    shell.run("adventure")
elseif nOption == 4 then
    shell.run("codOS/menu")
end