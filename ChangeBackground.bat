@echo off
title Change Background / Side Master

SET nameTitle=Change Background / SM

start "%SYSTEMROOT%/System32/" ribbons.scr /p65552

echo -------------------------------------
echo      %nameTitle%
echo -------------------------------------
SET /P select=(1) Close Background, (2) Finish: 
echo -------------------------------------

if %select% EQU 1 goto CloseBG
if %select% EQU 2 goto Finish

:CloseBG
taskkill /f /im Ribbons.scr

:Finish
pause
exit