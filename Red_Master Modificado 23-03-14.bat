@echo off
echo off
title Red Master - Side Master
:Setup
cd %HOMEDRIVE%
if not exist Voice (
goto Installer
	) else (
goto Menu
	)
:Menu
cls
color a1
mode 64,28
cd Voice
start Speak.vbs
cd ..
echo.
echo.
echo.
echo 	     Fecha: %date% , Hora: %time%
set starttime=%time%
echo     #######################################################
echo     ##$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$##
echo     ##                                                   ##
echo     ##                                                   ##
echo     ##                                                   ##
echo     ##        {=================================}        ##
echo     ##        (=    Bienvenido a Red Master=    )        ##
echo     ##        {=================================}        ##
echo     ##                                                   ##
echo     ##                                                   ##
echo     ##                                                   ##
echo     #######################################################
echo     # #######=====================================####### #
echo     # #                   RED MASTER                    # #
echo     # #######=====================================####### #
echo     #######################################################
echo                         //\\      //\\
echo                       ------------------
echo.
echo.
echo.
echo.
echo            Presione cualquier tecla para continuar!.
echo     -------------------------------------------------------
pause>nul
goto PressContinue

:PressContinue
cls   
mode 80,30  
color 1a
cd Voice
start Speak_Menu.vbs
cd ..
echo   ############################################################################
echo   =------------------------------  RED MASTER  ------------------------------=
echo   ############################################################################
echo               Seleccione la opcion escrita estre los parentecis!.
echo.       
echo        =================================================================
echo        = (1)= Show All - Mostrar Todo.                                 =
echo        = (2)= Show AlloOweXplicitCreds - Credenciales de usuario.      =
echo        = (3)= Show Autoconfig - Autoconfiguracion Habilitada o no.     =
echo        = (4)= Show BlockedNetworks - Bloqueo de Redes!.                =
echo        = (5)= Show CreateAllUserProfile - Autorizacion de Perfiles.    =
echo        = (6)= Show Drivers - Informacion de controladores LAN.         =
echo        = (7)= Show Filters - Redes Permitidas o Bloqueadas.            =
echo        = (8)= Show HostedNetwork - Red Hospedada.                      =
echo        = (9)= Show Interfaces - Mostrar Interfaces LAN.                =
echo        =(10)= Show Networks - Mostrar Redes.                           =
echo        =(11)= Show OnlyUseGPProfilesForAllOwedNetworks - GP.           =
echo        =(12)= Show Profiles - Perfiles en el Sistema.                  =
echo        =(13)= Show Settings - Configuracion Global LAN.                =
echo        =(14)= Show Tracing - Seguimiento Habilitado o no.              =
echo        =(15)= Show mas opciones de red!.                               =
echo        =(16)= Show opciones de Repositorio!.                           =
echo        =(17)= Exit                                                     =
echo        =================================================================
set /p Request=Esperando Respuesta: 
color 0F
if %Request% EQU 1 goto ShowOne
if %Request% EQU 2 goto ShowTwo
if %Request% EQU 3 goto ShowThree
if %Request% EQU 4 goto ShowFor
if %Request% EQU 5 goto ShowFive
if %Request% EQU 6 goto ShowSix
if %Request% EQU 7 goto ShowSeven
if %Request% EQU 8 goto ShowEigth
if %Request% EQU 9 goto ShowNine
if %Request% EQU 10 goto ShowTen
if %Request% EQU 11 goto ShowEleven
if %Request% EQU 12 goto ShowTwelve
if %Request% EQU 13 goto ShowThirteen
if %Request% EQU 14 goto ShowForteen
if %Request% EQU 15 goto ShowSixteen
if %Request% EQU 16 goto ShowFiveteen
if %Request% EQU 17 goto ShowFinish
if not defined %Request% goto NotExist
:ShowSixteen
cls
echo     ----------------------------------------------------------------------
echo     -    (1)Crear Red inalambrica, (2)Ir al menu principal, (3)Salir!.   -
echo     ----------------------------------------------------------------------
set /p network=Esperando Respuesta: 
if %network% EQU 1 goto CreateNetwork
if %network% EQU 2 goto PressContinue
if %network% EQU 3 goto ShowFinish
if not defined %network% goto NotExist
:CreateNetwork
cls
echo ----------------------------------------
echo -     Ingrese el nombre de la red!.    -
echo ----------------------------------------
set /p NameNetwork=Esperando Respuesta: 
echo ----------------------------------------
echo -   Ingrese la contrase¤a de la red!.  -
echo ----------------------------------------
echo.
echo Nota: Ingrese el password 
set /p PassNetwork=Esperando Respuesta: 
netsh wlan set hostednetwork mode=allow ssid="%NameNetwork%" key="%PassNetwork%"
netsh wlan start hostednetwork
echo -------------------------
echo -    Datos de la red    -
echo -------------------------
echo SSID: "%NameNetwork%"
echo -------------------------
echo Password: "%PassNetwork%"
echo -------------------------
echo Seguridad: WAP2-PSK
echo -------------------------
pause>nul

:ShowFiveteen
cls
echo ------------------------------------------------------------------------
echo (1)Repositorio en un solo fichero, (2)Repositorio en ficheros separados
echo ------------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo% EQU 1 goto RepositoryOneFile
if %RequestTwo% EQU 2 goto RepositoryMuchFile
if not defined %RequestTwo% goto NotExist
:RepositoryOneFile
cd %HOMEDRIVE%

:llamar
if not exist "Repositorio en un solo fichero" (
	goto Enter
	) else (
	goto NotEnter
	)
:NotEnter
cls
echo ------------------------------------------------------------------------------
echo -                           El fichero ya existe!.                           -
echo ------------------------------------------------------------------------------
echo -   (1)Reemplazar fichero, (2)Renombrar el fichero existente, (3)Cancelar!.  -
echo ------------------------------------------------------------------------------
set /p Option=Esperando Respuesta: 
if %Option% EQU 1 goto ReemplazarFile
if %Option% EQU 2 goto RenameFile
if %Option% EQU 3 goto ShowFinish
if not defined %Option% goto NotExist
:ReemplazarFile
cls
echo ---------------------------------------------------------------------
echo -           Has seleccionado la opcion Reemplazar Fichero.          -
echo ---------------------------------------------------------------------
rd /s /q "Repositorio en un solo fichero"
echo -  El directorio ha sido eliminado, presione enter para continuar.  -
echo ---------------------------------------------------------------------
pause>nul
goto Enter
:RenameFile
cls
echo ----------------------------------------------------
echo -  Has seleccionado la opcion Renombrar fichero!.  -
echo ----------------------------------------------------
echo -     Ingrese el nuevo nombre de el fichero!.      -
echo ----------------------------------------------------
set /p name=Esperando Respuesta: 
if exist "%name%" (
	cls
	echo           Este fichero ya existe
	goto FileExist
	) else (
	rename "Repositorio en un solo fichero" "%name%"
	goto RenameCorrect
	)
:FileExist
echo --------------------------------------------------
echo -        (1)Agregar otro nombre, (2)Salir        -
echo --------------------------------------------------
set /p othername=Esperando Respuesta: 
if %othername% EQU 1 goto RenameFile
if %othername% EQU 2 goto ShowFinish
if not defined %othername% goto NotExist
:RenameCorrect
cls
echo.
echo ----------------------------------------------
echo           Renombrado Correctamente!.
echo ----------------------------------------------
echo  (1)Continuar con la operacion, (2)Cancelar!.
echo ----------------------------------------------
set /p ContinuarOpe=Esperando Respuesta: 
if %ContinuarOpe% EQU 1 goto Enter
if %ContinuarOpe% EQU 2 goto PressContinue
if not defined %ContinuarOpe% goto NotExist
pause>nul
:Enter
md "Repositorio en un solo fichero"
cd "Repositorio en un solo fichero"
echo.
echo ---------------------------------------------------------------
echo - Se estan cargando los ficheros al directorio especificado!. -
echo ---------------------------------------------------------------
echo Llamando a la opcion show all (1) > %HOMEDRIVE%All_One.txt
netsh wlan show all >> %HOMEDRIVE%All_One.txt
echo Llamando a la opcion show allowexplicitcreds (2) >> %HOMEDRIVE%All_One.txt
netsh wlan show allowexplicitcreds >> %HOMEDRIVE%All_One.txt
echo Llamando a la opcion show autoconfig (3) >> %HOMEDRIVE%All_One.txt
netsh wlan show autoconfig >> %HOMEDRIVE%All_One.txt
echo Llamando a la opcion show blockednetworks (4) >> %HOMEDRIVE%All_One.txt
netsh wlan show blockednetworks >> %HOMEDRIVE%All_One.txt
echo Llamando a la opcion show createalluserprofile (5) >> %HOMEDRIVE%All_One.txt
netsh wlan show createalluserprofile >> %HOMEDRIVE%All_One.txt
echo Llamando a la opcion show drivers (6) >> %HOMEDRIVE%All_One.txt
netsh wlan show drivers >> %HOMEDRIVE%All_One.txt
echo Llamando a la opcion show filters (7) >> %HOMEDRIVE%All_One.txt
netsh wlan show filters >> %HOMEDRIVE%All_One.txt
echo Llamando a la opcion show hostednetwork (8) >> %HOMEDRIVE%All_One.txt
netsh wlan show hostednetwork >> %HOMEDRIVE%All_One.txt
echo Llamando a la opcion show interfaces (9) >> %HOMEDRIVE%All_One.txt
netsh wlan show interfaces >> %HOMEDRIVE%All_One.txt
echo Llamando a la opcion show networks (10) >> %HOMEDRIVE%All_One.txt
netsh wlan show networks >> %HOMEDRIVE%All_One.txt
echo Llamando a la opcion show OnlyUseGPProfilesForAllOwedNetworks (11) >> %HOMEDRIVE%All_One.txt
netsh wlan show OnlyUseGPProfilesForAllOwedNetworks >> %HOMEDRIVE%All_One.txt
echo Llamando a la opcion show Profiles (12) >> %HOMEDRIVE%All_One.txt
netsh wlan show Profiles >> %HOMEDRIVE%All_One.txt
echo Llamando a la opcion show settings (13) >> %HOMEDRIVE%All_One.txt
netsh wlan show settings >> %HOMEDRIVE%All_One.txt
echo Llamando a la opcion show tracing (14) >> %HOMEDRIVE%All_One.txt
netsh wlan show tracing >> %HOMEDRIVE%All_One.txt
cd ..
goto Nextt

:Nextt
cls
cd Voice
start OFC.vbs
cd ..
echo.
echo.
echo.
echo.
echo.
echo                       =====================================
echo                       =-----------------------------------=
echo                       =    Finalizado correctamente!!!.   =
echo                       =-----------------------------------=
echo                       =====================================
echo.
echo                       =====================================
echo                       = Presiona Enter para continuar!!!. =
echo                       =====================================
pause>nul
goto FinishRepository

:RepositoryMuchFile
echo       -----------------------------------------------
echo       -   Ingrese un nombre al nuevo directorio!.   -
echo       -----------------------------------------------
set /p directorio=Esperando Respuesta: 
cd %HOMEDRIVE%
if exist "%directorio%" (
	cls
	echo           El fichero ya existe!.
	echo ------------------------------------------
	pause>nul
	) else (
	echo Este fichero no existe, se puede hacer bien el directorio
	pause>nul
	)
md "%directorio%"
cd "%directorio%"
echo.
echo           Cargando datos al directorio especificado!.
echo        ------------------------------------------------
netsh wlan show all > Show_All.txt
netsh wlan show allowexplicitcreds > %HOMEDRIVE%AllowExplicitCreds.txt
netsh wlan show autoconfig > %HOMEDRIVE%Autoconfig.txt
netsh wlan show blockednetworks > %HOMEDRIVE%BlockedNetworks.txt
netsh wlan show createalluserprofile > %HOMEDRIVE%CreateAllUserProfile.txt
netsh wlan show drivers > %HOMEDRIVE%Drivers.txt
netsh wlan show filters > %HOMEDRIVE%Filters.txt
netsh wlan show hostednetwork > %HOMEDRIVE%HostedNetwork.txt
netsh wlan show interfaces > %HOMEDRIVE%Interfaces.txt
netsh wlan show networks > %HOMEDRIVE%Networks.txt
netsh wlan show OnlyUseGPProfilesForAllOwedNetworks > %HOMEDRIVE%OnlyUseGPProfilesForAllOwedNetworks.txt
netsh wlan show Profiles > %HOMEDRIVE%Profiles.txt
netsh wlan show settings > %HOMEDRIVE%Settings.txt
netsh wlan show tracing > %HOMEDRIVE%Tracing.txt
cd..
goto Next

:Next
cls
cd Voice
start OFC.vbs
cd ..
echo.
echo.
echo.
echo.
echo.
echo                       =====================================
echo                       =-----------------------------------=
echo                       =    Finalizado correctamente!!!.   =
echo                       =-----------------------------------=
echo                       =====================================
echo.
echo                       =====================================
echo                       = Presiona Enter para continuar!!!. =
echo                       =====================================
pause>nul
goto MoreOption

:MoreOption
cls
echo -------------------------------------------------------------------------------
echo Seleccione: (1)Mostrar directorio, (2)Cambiar Nombre, (3)Finalizar Repositorio.
echo -------------------------------------------------------------------------------
set /p OpRepositorio=Esperando Respuesta: 
if %OpRepositorio% EQU 1 goto ShowDir
if %OpRepositorio% EQU 2 goto RenameDir
if %OpRepositorio% EQU 3 goto FinishRepository
if not defined %OpRepositorio% goto NotExist

:ShowDir
cls
echo ------------------------------------------------------------------------
echo -            Seleccione como mostrar el directorio "%directorio%"
echo ------------------------------------------------------------------------
echo -     (1)Normal, (2)Formato Simple, (3)Listado Ancho, (4)Pausado       -
echo ------------------------------------------------------------------------
set /p usodir=Esperando Respuesta: 
cd %HOMEDRIVE%
cd "%directorio%"
if %usodir% EQU 1 goto DirNormal
if %usodir% EQU 2 goto DirFormatSimple
if %usodir% EQU 3 goto DirListWidth
if %usodir% EQU 4 goto DirPause
if not defined %usodir% goto NotExist
:DirNormal
dir
echo.
echo                 Presione Enter para continuar!.
echo               ----------------------------------
pause>nul
goto pasar
:DirFormatSimple
dir /b
echo.
echo                 Presione Enter para continuar!.
echo               ----------------------------------
pause>nul
goto pasar
:DirListWidth
dir /d
echo.
echo                 Presione Enter para continuar!.
echo               ----------------------------------
pause>nul
goto pasar
:DirPause
dir /p
echo.
echo                 Presione Enter para continuar!.
echo               ----------------------------------
pause>nul
goto pasar

:pasar
echo =======================================
echo =   Decea continuar (1)Si, (2)No !.   =
echo =======================================
set /p DeceaContinuar=Esperando Respuesta: 
if %DeceaContinuar% EQU 1 goto MoreOption
if %DeceaContinuar% EQU 2 goto FinishRepository
if not defined %DeceaContinuar% goto NotExist

:RenameDir

cls
echo ----------------------------------------------------------
echo -    Escriba el nuevo nombre de el directorio creado!.   -
echo ----------------------------------------------------------
set /p RenameFolder=Esperando Respuesta: 
echo.
echo --- Cambiando nombre de "%directorio%" a "%RenameFolder%" ---
rename "%directorio%" "%RenameFolder%"
echo.
echo     Presione Enter para continuar!.
echo --------------------------------------
set directorio=%RenameFolder%
pause>nul
goto Next

:ShowForteen
cls
echo -----------------------------------------------------------------------------
echo Muestra si el seguimiento de LAN inalambrica esta habilitado o deshabilitado
echo -----------------------------------------------------------------------------
echo Presione cualquier tecla para continuar con la aplicacion
pause>nul
netsh wlan show Tracing
echo -------------------------------------------------------------------
echo (1)Hacer Repositorio de la aplicacion!. (2)Menu principal
echo -------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo% EQU 1 goto RepositoryTwo
if %RequestTwo% EQU 2 goto PressContinue
if not defined %RequestTwo% goto NotExist
:RepositoryTwo
netsh wlan show Tracing > %HOMEDRIVE%Tracing.txt
goto FinishRepository

:ShowThirteen
cls
echo -----------------------------------------------------------------------------
echo Muestra si el seguimiento de LAN inalámbrica está habilitado o deshabilitado
echo -----------------------------------------------------------------------------
echo Presione cualquier tecla para continuar con la aplicacion
pause>nul
netsh wlan show settings
echo -------------------------------------------------------------------
echo (1)Hacer Repositorio de la aplicacion!. (2)Menu principal
echo -------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo% EQU 1 goto RepositoryTwo
if %RequestTwo% EQU 2 goto PressContinue
if not defined %RequestTwo% goto NotExist
:RepositoryTwo
netsh wlan show settings > %HOMEDRIVE%Settings.txt
goto FinishRepository

:ShowTwelve
cls
echo ----------------------------------------------------------
echo Muestra una lista de perfiles configurados en el sistema.
echo ----------------------------------------------------------
echo Presione cualquier tecla para continuar con la aplicacion
pause>nul
netsh wlan show Profiles
echo -------------------------------------------------------------------
echo (1)Hacer Repositorio de la aplicacion!. (2)Menu principal
echo -------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo EQU 1 goto RepositoryTwo
if %RequestTwo EQU 2 goto PressContinue
if not defined %RequestTwo% goto NotExist
:RepositoryTwo
netsh wlan show Profiles > %HOMEDRIVE%Profiles.txt
goto FinishRepository

:ShowEleven
cls
echo --------------------------------------------------
echo Muestra perfiles GP en redes configuradas con GP
echo --------------------------------------------------
echo Presione cualquier tecla para continuar con la aplicacion
pause>nul
netsh wlan show OnlyUseGPProfilesForAllOwedNetworks
echo -------------------------------------------------------------------
echo (1)Hacer Repositorio de la aplicacion!. (2)Menu principal
echo -------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo EQU 1 goto RepositoryTwo
if %RequestTwo EQU 2 goto PressContinue
if not defined %RequestTwo% goto NotExist
:RepositoryTwo
netsh wlan show OnlyUseGPProfilesForAllOwedNetworks > %HOM
goto FinishRepository

:ShowTen
cls
echo ---------------------
echo Muestra las redes
echo ---------------------
echo Presione cualquier tecla para continuar con la aplicacion
pause>nul
netsh wlan show networks
echo -------------------------------------------------------------------
echo (1)Hacer Repositorio de la aplicacion!. (2)Menu principal
echo -------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo EQU 1 goto RepositoryTwo
if %RequestTwo EQU 2 goto PressContinue
if not defined %RequestTwo% goto NotExist
:RepositoryTwo
nets
goto FinishRepository

:ShowNine
cls
echo -------------------------------------------------
echo Muestra las Interfaces conectadas en el Sistema
echo -------------------------------------------------
echo Presione cualquier tecla para continuar con la aplicacion
pause>nul
netsh wlan show interfaces
echo -------------------------------------------------------------------
echo (1)Hacer Repositorio de la aplicacion!. (2)Menu principal
echo -------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo EQU 1 goto RepositoryTwo
if %RequestTwo EQU 2 goto PressContinue
if not defined %RequestTwo% goto NotExist
:RepositoryTwo
netsh wl
goto FinishRepository

:ShowEigth
cls
echo ---------------------------------------------
echo Muestra las Redes Hospedadas en el Sistema
echo ---------------------------------------------
echo Presione cualquier tecla para continuar con la aplicacion
pause>nul
netsh wlan show hostednetwork
echo -------------------------------------------------------------------
echo (1)Hacer Repositorio de la aplicacion!. (2)Menu principal
echo -------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo EQU 1 goto RepositoryTwo
if %RequestTwo EQU 2 goto PressContinue
if not defined %RequestTwo% goto NotExist
goto FinishRepository

:ShowSeven
cls
echo -------------------------------------------------------------
echo Muestra la lista de redes permitidas y bloqueadas.
echo -------------------------------------------------------------
echo Presione cualquier tecla para continuar con la aplicacion
pause>nul
netsh wlan show filters
echo -------------------------------------------------------------------
echo (1)Hacer Repositorio de la aplicacion!. (2)Menu principal
echo -------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo EQU 1 goto RepositoryTwo
if %RequestTwo EQU 2 goto PressContinue
if not defined %RequestTwo% goto NotExist
goto FinishRepository

:ShowSix
cls
echo ---------------------------------------------------------------------------
echo Muestra las propiedades de los controladores LAN inalámbricos en el Sistema
echo ---------------------------------------------------------------------------
echo Presione cualquier tecla para continuar con la aplicacion
pause>nul
netsh wlan show drivers
echo -------------------------------------------------------------------
echo (1)Hacer Repositorio de la aplicacion!. (2)Menu principal
echo -------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo EQU 1 goto RepositoryTwo
if %RequestTwo EQU 2 goto PressContinue
if not defined %RequestTwo% goto NotExist
goto FinishRepository

:ShowFive
cls
echo --------------------------------------------------------------------
echo Muestra Permisos a usuarios que pueden hacer cambio a otros usuarios
echo --------------------------------------------------------------------
echo Presione cualquier tecla para continuar con la aplicacion
pause>nul
netsh wlan show createalluserprofile
echo -------------------------------------------------------------------
echo (1)Hacer Repositorio de la aplicacion!. (2)Menu principal
echo -------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo EQU 1 goto RepositoryTwo
if %RequestTwo EQU 2 goto PressContinue
if not defined %RequestTwo% goto NotExist
:RepositoryTwo
netsh wlan show createalluserprofile > %HOMEDRIVE%CreateAllUserProfile.txt
goto FinishRepository

:ShowFor
cls
echo -------------------------------------------------------------------
echo Configuración de LAN inalámbrica
echo -------------------------------------------------------------------
echo Presione cualquier tecla para continuar con la aplicacion
pause>nul
netsh wlan show blockednetworks
echo -------------------------------------------------------------------
echo (1)Hacer Repositorio de la aplicacion!. (2)Menu principal
echo -------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo EQU 1 goto RepositoryTwo
if %RequestTwo EQU 2 goto PressContinue
if not defined %RequestTwo% goto NotExist
:RepositoryTwo
netsh wlan show blockednetworks > %HOMEDRIVE%BlockedNetworks.txt
goto FinishRepository

:ShowThree
cls
echo -------------------------------------------------------------------
echo Configuración de LAN inalámbrica
echo -------------------------------------------------------------------
echo Presione cualquier tecla para continuar con la aplicacion
pause>nul
netsh wlan show autoconfig
echo -------------------------------------------------------------------
echo (1)Hacer Repositorio de la aplicacion!. (2)Menu principal
echo -------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo EQU 1 goto RepositoryTwo
if %RequestTwo EQU 2 goto PressContinue
if not defined %RequestTwo% goto NotExist
:RepositoryTwo
netsh wlan show autoconfig > %HOMEDRIVE%Autoconfig.txt
echo Guardado correctamente en su Escritorio.
goto FinishRepository

rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:ShowTwo
rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
cls
echo -------------------------------------------------------------------------------
echo Muestra la configuración para permitir o no credenciales de usuario compartidas
echo -------------------------------------------------------------------------------
echo          Seleccione: (1)Infrmacion sobre la herramienta, (2)continuar
echo -------------------------------------------------------------------------------
set /p infocont=Esperando Respuesta: 
if %infocont EQU 1 goto infoop2
if %infocont EQU 2 goto ContinueTwo
if not defined %infocont% goto NotExist
:infoop2
cls
echo ------------------------------------------------------
echo -  Infrmacion de la herramienta: AllowExplicitCreds  -
echo ------------------------------------------------------
netsh wlan show allowexplicitcreds /?
echo --------------------------------------------------------------------
echo (1)Hacer Repositorio de la informacion!. (2)Menu principal, (3)Atras
echo --------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo% EQU 1 goto RepositoryTwoInfo
if %RequestTwo% EQU 2 goto PressContinue
if %RequestTwo% EQU 3 goto ShowTwo
if not defined %RequestTwo% goto NotExist
:RepositoryTwoInfo
netsh wlan show allowexplicitcreds /? > %HOMEDRIVE%AllowExplicitCredsInfo.txt
goto FinishRepository
:ContinueTwo
netsh wlan show allowexplicitcreds
echo -------------------------------------------------------------------
echo (1)Hacer Repositorio de la aplicacion!. (2)Menu principal, (3)Atras
echo -------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo% EQU 1 goto RepositoryTwoOri
if %RequestTwo% EQU 2 goto PressContinue
if %RequestTwo% EQU 3 goto ShowTwo
if not defined %RequestTwo% goto NotExist
:RepositoryTwoOri
netsh wlan show allowexplicitcreds > %HOMEDRIVE%ShowAllOweXplicitCreds.txt
goto FinishRepository


rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:ShowOne
rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
cls
echo -------------------------------------------------------------------
echo Muestra el dispositivo inalambrico completo e informacion de Redes.
echo -------------------------------------------------------------------
echo Seleccione: (1)Infrmacion sobre la herramienta, (2)continuar
echo -------------------------------------------------------------------
set /p infocont=Esperando Respuesta: 
if %infocont% EQU 1 goto infoop1
if %infocont% EQU 2 goto ContinueOne
if not defined %infocont% goto NotExist
:infoop1
cls
echo ----------------------------------------
echo  Infrmacion de la herramienta: Show All
echo ----------------------------------------
netsh wlan show all /?
echo --------------------------------------------------------------------
echo (1)Hacer Repositorio de la informacion!. (2)Menu principal, (3)Atras
echo --------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo% EQU 1 goto RepositoryOneInfo
if %RequestTwo% EQU 2 goto PressContinue
if %RequestTwo% EQU 3 goto ShowOne
if not defined %RequestTwo% goto NotExist
:RepositoryOneInfo
netsh wlan show all /? > %HOMEDRIVE%ShowAllInfo.txt
goto FinishRepository
:ContinueOne
netsh wlan show all
echo -------------------------------------------------------------------
echo (1)Hacer Repositorio de la aplicacion!. (2)Menu principal, (3)Atras
echo -------------------------------------------------------------------
set /p RequestTwo=Esperando Respuesta: 
if %RequestTwo% EQU 1 goto RepositoryOneOri
if %RequestTwo% EQU 2 goto Menu
if %RequestTwo% EQU 3 goto ShowOne
if not defined %RequestTwo% goto NotExist
:RepositoryOneOri
netsh wlan show all > %HOMEDRIVE%ShowAll.txt
goto FinishRepository

:FinishRepository
cls
echo -------------------------------------------------------------------
echo -  Repositorio creado con exito!!!. (1)Menu principal , (2)Salir  -
echo -------------------------------------------------------------------
set /p MenuSalir=Esperando Respuesta: 
if %MenuSalir% EQU 1 goto PressContinue
if %MenuSalir% EQU 2 goto ShowFinish
if not defined %MenuSalir% goto NotExist

:NotExist
cls
echo El dato ingresado es invalido!. Decea ingresar otro (1)Si, (2)No
set /p Sect=Esperando Respuesta: 
if %Sect% EQU 1 goto PressContinue
if %Sect% EQU 2 goto ShowFinish
if not defined %Sect% goto NotExist

:Installer
cls
color 0F
echo ============================================
echo =       Bienvenido a la instalacion        =
echo ============================================
color 4C
echo =  # Ruteando directorio actual...
echo =/................................................/
echo = Creando el directorio: Voice
md Voice
echo =/................................................/
echo = Ruteando al directorio: Voice
cd Voice
echo =/................................................/
cd %HOMEDRIVE%
color 1A
echo =  # Instalando Voces...
echo =/................................................/
echo SpeakWriteMe = ("Bienvenido a Red Master. Presione cualquier tecla para continuar!.") > Speak.vbs
echo set ObjectVoice = CreateObject("SAPI.SpVoice") >> Speak.vbs
echo ObjectVoice.Speak SpeakWriteMe >> Speak.vbs
echo =  # Voz de Bienvenida instalado correctamente
echo =/................................................/
echo SpeakWriteMe = ("Seleccione una opcion en especifica!.") > Speak_Menu.vbs
echo set ObjectVoice = CreateObject("SAPI.SpVoice") >> Speak_Menu.vbs
echo ObjectVoice.Speak SpeakWriteMe >> Speak_Menu.vbs
echo =  # Voz de el Menu instalado correctamente!.
echo =/................................................/
echo SpeakWriteMe = ("Gracias por utilizar Red Master, Hasta la proxima!.") > Thank_You.vbs
echo set ObjectVoice = CreateObject("SAPI.SpVoice") >> Thank_You.vbs
echo ObjectVoice.Speak SpeakWriteMe >> Thank_You.vbs
echo =  # Voz de Gracias por utilizar Red Master!.
echo =/................................................/
echo SpeakWriteMe = ("Operacion Finalizada correctamente!.") > OFC.vbs
echo set ObjectVoice = CreateObject("SAPI.SpVoice") >> OFC.vbs
echo ObjectVoice.Speak SpeakWriteMe >> OFC.vbs
echo =  # Voz de Operacion Finalizada Correctamente!.
echo =/................................................/
echo SpeakWriteMe = ("Instalacion completada correctamente!, Presione una tecla para continuar.") > InstalationComplete.vbs
echo set ObjectVoice = CreateObject("SAPI.SpVoice") >> InstalationComplete.vbs
echo ObjectVoice.Speak SpeakWriteMe >> InstalationComplete.vbs
start InstalationComplete.vbs
echo =  # Voz de instalacion completada!.
echo =/................................................/
color 2F
echo =============================================
echo =        Finalizado correctamente!.         =
echo =============================================
echo     Presione una tecla para continuar!.
cd ..
pause>nul
goto :Menu

:ShowFinish
cls
cd Voice
start Thank_You.vbs
cd ..
echo.
echo.
echo                             Iniciastes: %starttime%
echo.
echo.
echo.
echo.
echo.
echo.
echo                      ####################################
echo                      #----------------------------------#
echo                      #  Gracias por utilizar Red Master #
echo                      #----------------------------------#
echo                      ####################################
echo.
echo                       Presiona una tecla para Finalizar!.
echo                   ------------------------------------------
echo.
echo.
echo.
echo.
echo.
echo                             Finalizando: %time%
pause>nul
exit