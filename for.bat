@ftp -i -s:"%~f0"&GOTO:EOF
@echo off
title SM
echo Ingrese el inicio
for /l %%x in (1, 1, 5) do (
   echo %%x
   echo Terminado > info%%x.txt
)
echo La suma de los valores es: %suma%
echo Finalizado correctamente!.
pause>nul
exit