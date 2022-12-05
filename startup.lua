local oldPull = os.pullEvent
os.pullEvent = os.pullEventRaw

--change pass variable if you want to edit your
--password, if it is nothing (WITH NO SPACES)
--you will not have a password menu show up.
--You may still have spaces in your password if you
--are using a password.
pass = ""

--if you want the codOS logo to show on startup,
--set this varaible to 1, if not, set it to 0
showLogo = 0

if showLogo > 0 then
    term.clear()
    term.setCursorPos(1,1)

    print(" _____       _ _____ _____ ")
    print("|     |___ _| |     |   __|")
    print("|   --| . | . |  |  |__   |")
    print("|_____|___|___|_____|_____|")
    textutils.slowPrint("welcome!")
    sleep(3)
end

term.clear()
term.setCursorPos(1,1)

if pass == "" then
    shell.run("codOS/menu.lua")
else

    print("password here:")
    input = read()
    
    if input == pass then
        print("c'mon in!")
        sleep(3)
        shell.run("codOS/menu.lua")
    else
        print("yo don't steal yo!")
        sleep(3)
        os.reboot()
    end
end

os.pullEvent = oldPull  
