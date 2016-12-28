Set oWMP = CreateObject("WMPlayer.OCX.7" ) 
Set colCDROMs = oWMP.cdromCollection 

if colCDROMs.Count then 
For i = 0 to colCDROMs.Count - 1 
colCDROMs.Item(i).Eject 
Next ' cdrom 
End If