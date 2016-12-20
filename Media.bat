@echo off
title Hacer media de dos numeros
:principio
set/p cant=Entre cuantos numeros quiere hacer la media?
set/a contador=%cant%
set total=0
if %cant% LSS 2 (goto mal) else (goto pregunta)
:mal
echo Debe indicar un numero mayor o igual que 2
goto principio
:pregunta
set/p num=Escriba uno de los %cant% numeros
set/a total=%total%+%num%
set/a contador=%contador%-1
if not %contador% == 0 (goto pregunta)
set/a media= %total% / %cant%
echo.
echo La media es %media%
pause >nul
exit