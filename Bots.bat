@echo off
title Bots Side Master
:starting
echo              =========================================
echo              ==         BotNet Side Master          ==
echo              =========================================
echo.   
echo              =========================================
echo              =            Ingrese el link            =
echo              =        ----------------------         =
echo              =========================================
set /p link=Esperando Respuesta: 
echo.
goto SelectVisit
:SelectVisit
cls
echo      =======================================================
echo      ==           Seleccione cuantas visitas              ==
echo      =======================================================
echo      = (1)50, (2)100, (3)250, (4)500, (5)1000, (6)Ingresar =
echo      =======================================================
set /p Select=Esperando Respuesta: 
if %Select% EQU 1 goto Op50
if %Select% EQU 2 goto Op100
if %Select% EQU 3 goto Op250
if %Select% EQU 4 goto Op500
if %Select% EQU 5 goto Op1000
if %Select% EQU 6 goto Enter
if %Select% LSS 1 goto ErrorFatal
if %Select% GTR 5 goto ErrorFatal
if not defined %Select% goto ErrorFatal
:Op50
echo   Has seleccionado hacer 50 visitas simultaneas!.
echo ---------------------------------------------------
set numvisit=50
goto EnterNext
:Op100
echo   Has seleccionado hacer 100 visitas simultaneas!.
echo ---------------------------------------------------
set numvisit=100
goto EnterNext
:Op250
echo   Has seleccionado hacer 250 visitas simultaneas!.
echo ---------------------------------------------------
set numvisit=250
goto EnterNext
:Op500
echo   Has seleccionado hacer 500 visitas simultaneas!.
echo ---------------------------------------------------
set numvisit=500
goto EnterNext
:Enter
cls
echo ---------------------------------------------------
echo       Ingrese el numero de visitas al link!.
echo ---------------------------------------------------
set /p numvisit=Esperando Respuesta: 
goto EnterNext
:EnterNext
for /l %%x in (1, 1, %numvisit%) do (
	echo Esta es la visita numero %%x de %numvisit%
	echo -------------------------------
	echo   Contador del video activo!.
	echo -------------------------------
	start %link%
	for /l %%y in (1, 1, 25) do (
		ping -n 2 0.0.0.0 > nul
		echo %%y
		)
	echo ------------------------------
	echo Matando Procesos de Navegacion
	echo ------------------------------
	taskkill /f /im chrome.exe
	taskkill /f /im opera.exe
	taskkill /f /im iexplorer.exe
	taskkill /f /im firefox.exe
	echo ------------------------------
	echo Reiniciando IP - Actualizando
	echo ------------------------------
	ipconfig /release
	ipconfig /renew
	cls
	)
echo ===============================================================
echo =    Listo!. Las %numvisit% visitas han sido completadas!.    =
echo ===============================================================
echo = (1)Ir al Principio           = (2)Ir al Selector de visitas =
echo ---------------------------------------------------------------
echo = (3)Cambiar el Link Propuesto = (4)Finalizar Aplicacion      =
echo ---------------------------------------------------------------
set /p Option=Esperando Respuesta: 
if %Option% EQU 1 goto starting
if %Option% EQU 2 goto SelectVisit
if %Option% EQU 3 goto ChangeLink
if %Option% EQU 4 goto Finish
if not defined %Option% goto ErrorFatal
:ChangeLink
echo ---------------------------
echo - Ingrese el nuevo Link!. -
echo ---------------------------
set /p link=Esperando Respuesta: 
goto EnterNext
:ErrorFatal
cls
echo   El dato introducido no es valido!.
echo --------------------------------------
echo     Decea continuar (1)Si, (2)No!.
echo --------------------------------------
set /p Select2=Esperando Respuesta: 
if %Select2% EQU 1 goto starting
if %Select2% EQU 2 goto Finish
if not defined %Select2% goto ErrorFatal
:Finish
cls
color A
echo.
echo.
echo.
echo                                         -
echo                                       - - -
echo                                     - - - - -
echo                                   - - - - - - -
echo                                 - - - - - - - - -
echo                               - - - - - - - - - - -   
echo                             - - - - - - - - - - - - -
echo                             -------------------------
echo                             -   Hasta la proxima!.  -
echo                             -------------------------
echo                             - - - - - - - - - - - - -
echo                               - - - - - - - - - - - 
echo                                 - - - - - - - - -
echo                                   - - - - - - -
echo                                     - - - - -
echo                                       - - -
echo                                         -
pause>nul 
exit