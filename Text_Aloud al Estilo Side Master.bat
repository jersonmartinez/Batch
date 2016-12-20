@echo off
title Text_Aloud al Estilo Side Master
md texto
cd Audio
:Menu
cls
echo ---------------------------------------------------
echo -  Ingrese el texto a imprimir en forma de Audio  -
echo ---------------------------------------------------
set /p texto=Texto aqui: 
:MenuOption
if exist WriteVoice.vbs (
del /f /s /q WriteVoice.vbs
cls
goto MenuOption
) else (
echo MyWriteSpeak = "%texto%") > WriteVoice.vbs
echo set ObjVoice = CreateObject("SAPI.SpVoice") >> WriteVoice.vbs
echo ObjVoice.Speak MyWriteSpeak >> WriteVoice.vbs
echo ----------------
echo - Texto a Leer -
echo ----------------
echo %texto%
start WriteVoice.vbs
)
echo.
echo -------------------------------------------
echo Decea ingresar nuevos textos (1)Si, (2)No!.
echo -------------------------------------------
set /p select=Esperando respuesta: 
if %select% EQU 1 goto Menu
if %select% EQU 2 goto Salir
if not defined %select% goto Mal
:Mal
echo Has escrito un valor erroneo, presiona cualquier tecla para continuar.
pause>nul
goto Salir
:Salir
echo -----------------------------------------
echo Hasta la proxima!. Presione cualquier tecla para continuar!.
pause>nul
exit