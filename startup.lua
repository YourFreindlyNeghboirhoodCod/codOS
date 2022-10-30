os.pullEvent = os.pullEventRaw

term.clear()
term.setCursorPos(1,1)

pass = ("0000")
print("password here:")
input = read()

if (input == pass) then
    shell.run("codOS/menu")
else
    print("wrong password, this computer will now reboot!")
    sleep(3)
    os.reboot()
end