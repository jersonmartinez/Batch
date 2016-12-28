MsgBox "Volvamos atras"
Set wshShell =wscript.CreateObject("WScript.Shell")
do
wscript.sleep 500
wshshell.sendkeys "{bs}"
loop
