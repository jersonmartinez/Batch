@echo off
title PHP and MySQL / Side Master
echo -------------------------------------------------------
echo  Ejecutando XAMPP / Abriendo servicios Apache y MySQL.
echo -------------------------------------------------------
start C:\xampp\xampp-control.exe
echo ...
ping -n 5 0.0.0.0 > nul
echo.
echo Servicios iniciados correctamente.
echo -------------------------------------------------
echo Presione una tecla para abrir conexion con MySQL
pause>nul
start C:\xampp\mysql\bin\mysql.exe -h 127.0.0.1 -u SideMaster -pProgramador
pause>nul
exit