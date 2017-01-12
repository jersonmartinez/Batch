@echo off
title View Key Network / Side Master

:StartScript
echo ----------------------------------
echo         Listing Networks...
echo ----------------------------------

echo.

	netsh wlan show profile

echo.

echo ----------------------------------
echo      Write the name Network
echo ----------------------------------

	set /p name=Waiting answer: 

echo.

echo ----------------------------------
echo         Loading key...
echo ==========------------------------
echo = Result =
echo ==========

	netsh wlan show profile name=%name% key=clear | find "Contenido de la clave"

echo.
echo.
echo ----------------------------------
echo   (1) - Exit,    (2) - Try again
echo ----------------------------------

set /p number=Waiting answer: 
if %number% EQU 1 goto Finish
if %number% EQU 2 goto StartScript

:Finish
echo.
echo Presione cualquier tecla para finalizar.
pause>nul
exit