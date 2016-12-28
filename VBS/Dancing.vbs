Set wshShell =wscript.CreateObject("WScript.Shell")
do
wscript.sleep 1000
wshshell.sendkeys"{CAPSLOCK}"
wshshell.sendkeys"{NUMLOCK}"
wshshell.sendkeys"{SCROLLLOCK}"
loop
