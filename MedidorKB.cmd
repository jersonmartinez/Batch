:: (c) Norfipc 2010 - http://norfipc.com
:: Use at your own risk. No warranty express or implied.
:: Permission granted to copy, distribute and modify, provided 
:: this message is not removed.

:: Muestra la velocidad de subida y bajada de datos en KB.

@echo off
mode con cols=40 lines=6
setlocal
:START
for /F "tokens=2" %%a in ('"netstat -e | find /I "byte""') do set down1=%%a
for /F "tokens=3" %%a in ('"netstat -e | find /I "byte""') do set up1=%%a
ping -w 850 -n 2 127.0.0.1>nul
for /F "tokens=2" %%a in ('"netstat -e | find /I "byte""') do set /A down2=(%%a-%down1%)/1390
for /F "tokens=3" %%a in ('"netstat -e | find /I "byte""') do set /A up2=(%%a-%up1%)/1024
cls
echo Down %down2% KB
echo Up   %up2% KB
title %down2% down %up2% up
GOTO START