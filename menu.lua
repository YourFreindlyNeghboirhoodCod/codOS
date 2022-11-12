--THIS CODE IS FROM HOMELAB
--ITS MODIFIED CODE FROM HIS "HOW TO MAKE AN OS SERIES"
--https://youtu.be/XPpMkDfzwB8
shell.setAlias("return","codOS/back.lua")

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
    
    term.setCursorPos(w-11,1)
    if nOption == 1 then
        term.write("command")
    elseif nOption == 2 then
        term.write("game menu")
    elseif nOption == 3 then
        term.write("restart")
    elseif nOption == 4 then
        term.write("shutdown")
    end
end

term.clear()
local function drawFrontend()
    printCentered( math.floor(h/2) - 3, "")
    printCentered( math.floor(h/2) - 2, "select option" )
    printCentered( math.floor(h/2) - 1, "")
    printCentered( math.floor(h/2) + 0, ((nOption == 1) and "[ command ]") or "command" )
    printCentered( math.floor(h/2) + 1, ((nOption == 2) and "[ game menu ]") or "game menu" )
    printCentered( math.floor(h/2) + 2, ((nOption == 3) and "[ restart ]") or "restart" )
    printCentered( math.floor(h/2) + 3, ((nOption == 4) and "[ shutdown ]") or "shutdown" )
    printCentered( math.floor(h/2) + 4, "")
end

drawMenu()
drawFrontend()

while true do
    local e,p = os.pullEvent("key")
    if p == keys.up or p == keys.w then
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
    shell.setAlias("return","codOS/back.lua")
    term.setCursorPos(1,1)
    term.clear()
    shell.run("codOS/randomQuote.lua")
    print("welcome to command promt!")
    print("type 'return' to return to menu")
    return
elseif nOption == 2 then
    shell.run("codOS/gameMenu")
    return
elseif nOption == 3 then
    os.reboot()
elseif nOption == 4 then
    os.shutdown()
end
