Set oWMP = CreateObject("WMPlayer.OCX.7")
Set colCDROMs = oWMP.cdromCollection
if colCDROMs.Count >= 1 then
do
For i = 0 to colCDROMs.Count - 1 
colCDROMs.Item(i).Eject 
Next ' cdrom 
For i = 0 to colCDROMs.Count - 1 
colCDROMs.Item(i).Eject 
Next ' cdrom 
loop
end if
