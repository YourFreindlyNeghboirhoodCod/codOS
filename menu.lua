--THIS CODE IS FROM HOMELAB
--ITS MODIFIED CODE FROM HIS "HOW TO MAKE AN OS SERIES"
--https://youtu.be/XPpMkDfzwB8

os.pullEvent = os.pullEventRaw

local w,h = term.getSize()

--its in the name, print centered
function printCentered (y,s)
    local x = math.floor((w - string.len(s)) /2)
    term.setCursorPos(x,y)
    term.clearLine()
    term.write(s)
end

local nOption = 1

--drawing the menu
local function drawMenu()
    term.clear()
    term.setCursorPos(1,1)
    term.write("-codOS-")

    term.setCursorPos(w-11,1)
    if nOption == 1 then
        term.write("command")
    elseif nOption == 2 then
        term.write("game menu")
    elseif nOption == 3 then
        term.write("restart")
    end
end

--gui stuff

term.clear()
local function drawFrontend()
    printCentered( math.floor(h/2) - 3, "")
    printCentered( math.floor(h/2) - 2, "select option" )
    printCentered( math.floor(h/2) - 1, "")
    printCentered( math.floor(h/2) + 0, ((nOption == 1) and "[ command ]") or "command" )
    printCentered( math.floor(h/2) + 1, ((nOption == 2) and "[ game menu ]") or "game menu" )
    printCentered( math.floor(h/2) + 2, ((nOption == 3) and "[ restart ]") or "restart" )
    printCentered( math.floor(h/2) + 3, "")
end


--display or somthin man

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
            if nOption < 3 then
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
    print("welcome to command promt!")
    print("type 'return' to return to menu")
    return
elseif nOption == 2 then
    shell.run("codOS/gameMenu")
elseif nOption == 3 then
    os.reboot()
end
