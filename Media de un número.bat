@echo off
title Media / Side Master
echo --------------
echo Bienvenido!!!.
echo --------------
set /p num=Ingrese el numero de cantidades: 
set /a contador=%num%
:Continue
set /a cont=%cont%+1
set /p cant=Ingrese la cantidad #%cont%: 
set /a suma=%suma%+%cant%
if %num% EQU %cont% goto (
	goto Finalizar
	) else (
	goto Continue
	)
:Finalizar
set /a media=%suma% / %num%
echo La media es: %media%
pause>nul
exit