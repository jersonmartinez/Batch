@echo off
title BotNet Side Master
:Menu
start http://www.youtube.com/watch?v=po7PsjJH-38
for /l %%x in (1, 1, 25) do (
ping -n 2 0.0.0.0 > nul
echo %%x
)
echo Listo, han pasado 30 segundos
for /l %%y in (1, 1, 1) do (
ping -n 2 0.0.0.0 > nul
)
taskkill /f /im chrome.exe
taskkill /f /im firefox.exe
taskkill /f /im iexplorer.exe
taskkill /f /im opera.exe
ipconfig /relase
ipconfig /renew
goto :Menu
pause>nul
exit