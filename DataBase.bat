@echo off
title Base de datos Clientes
color b5
:bienvenido
cls
echo .
echo %OS%
echo . 
echo .
echo .
echo                  BIENVENIDO A LA FACTURADORA!!
echo       INICE SECION PARA COMENZAR
echo . 
echo .
echo .
echo . 
echo .
echo .
echo          %USERNAME%                  ADMINISTRADOR  
Set input=
set /p input= Password (Introdusca y ponga enter) :
if %input%==tienda goto menu
if not %input%==tienda goto passno
echo.
:passno
echo .
echo .
echo                       PASSWORD INCORRECTO INTENTE DE NUEVO
echo .
echo .
pause 
goto bienvenido 

:menu
cls
mode 100,50
echo.&&echo.                                         
echo                              °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°                 
echo                              °Fecha :: %DATE%  Hora:: %TIME%°°
echo                              °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
echo .
echo .
echo               °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°° 
echo               °------1.- Añadir Cliente    °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
echo               °---------- 2.- Buscar Cliente    °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
echo               °----------- ---3.- Mostrar Todos Los Clientes Registrados  °°°°
echo               °-----------------4.- Borrar Base de datos Cliente        °°°°°°°°°
echo               °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
echo               °------------------------5.- VENTA        °°°°°°°°°°°°°°°°°°°°°°°°°°  
echo               °--------------------- -------6.- Ver Ventas    °°°°°°°°°°°°°°°°°°°°
echo               °--------------------------------7.- Calculadora      °°°°°°°°°°°°°°°
echo               °-------------------------------------8.- Borrar Ventas    °°°°°°°°°°
echo               °----------------------------------------- 9.- Notas!   °°°°°°°°°°°°°° 
echo               °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°° 
echo . 
echo  NOTA  
type %homedrive%nota.txt
echo --------------------------------
set /p o= Elija una opcion :
if %o%==1 (goto add)
if %o%==2 (goto b) 
if %o%==3 (goto x) 
if %o%==4 (goto dl) 
if %o%==5 (goto ven)
if %o%==6 (goto ver) 
if %o%==7 (goto equ) 
if %o%==8 (goto vent)  
if %o%==9 (goto nota)
if %o%==exit (goto exit)
if %o%==salir (goto exit)  else (goto menu)
if not defined %o% goto menu  

:exit
exit


 

:nota
cls
set /p not= Escriba Alguna Nota =
echo NOTA GUARDADA!! 
echo %not%
pause
if exist %homedrive%nota.txt  del %homedrive%nota.txt
echo >>    :%not%>>%homedrive%nota.txt


goto menu



:vent
cls
echo.
echo Se borrara la base de datos esta seguro si/no
echo Se perderan todo los datos guardados
set /p de=^>^>
if %de%==si (goto del2) else (goto menu)
if %de%==no (goto menu)

:del2
cls
echo Borrando...
ping -n 2 0.0.0.0>nul
del /q /f %homedrive%ventas.txt
echo Eliminado
pause
goto menu



:equ
IF NOT EXIST  %homedrive%/calc.bat  (
echo             EL ARCHIVO CALCULADORA NO ESTA ALOJADO
echo        EN EL DISCO LOCAL %homedrive%  COPIELO EN ESA DIRECCION
) ELSE (
             start %homedrive%/calc.bat 
)

:add
cls
set /p name= Nombre de cliente =
set /p dire= Direccion         =
set /p n= Numero               = 
set /p c= Compras Recientes    =
set /p t= Deudas/Describcion                =
set /p s=  N° Ref        =
echo Cliente    :%name%>>%homedrive%clientes.txt
echo Direccion  :%dire%>>%homedrive%clientes.txt
echo Numero     :%n%>>%homedrive%clientes.txt
echo Compras Recientes    :%c%>>%homedrive%clientes.txt
echo Deudas/Describcion      :%t%>>%homedrive%clientes.txt
echo  N° Ref      :%s%>>%homedrive%clientes.txt
echo ------------------------------------------------->>%homedrive%clientes.txt
echo Generado Correctamente
pause
goto menu
 
:b
cls
set /p bo= Que desea buscar dentro de la Base de datos :
setlocal enabledelayedexpansion
for /f "tokens=*" %%_ in ('find "%bo%" "%homedrive%clientes.txt" ') do (
   set "valor=%%_"
   echo El valor es : !valor!
)
pause
goto menu


















 
:dl
setlocal enabledelayedexpansion enableextensions
echo.
echo. Cargando...
echo.
set "bar="
set "percent=0"
set "count=0"
for /l %%i in (1,1,50) do set "bar=!bar!±"
:loop
set /p "= %bar:~0,20% %percent%%%"<nul
ping -n 1 -w 1 localhost>nul
for /l %%i in (1,1,26) do set /p "="<nul
set "bar=Û%bar%"
set /a "count+=1"
set /a "percent+=5"
if %count% leq 20 goto:loop
echo.
echo.
echo. Done.
echo Se borrara la base de datos esta seguro si/no
echo Se perderan todo los datos guardados
set /p de=^>^>
if %de%==si (goto del) else (goto menu)
if %de%==no (goto menu)
pause>nul

 
:del
cls
echo Borrando...
ping -n 2 0.0.0.0>nul
del /q /f %homedrive%clientes.txt
echo Eliminado
pause
goto menu


 
:x
cls
echo.
type %homedrive%clientes.txt
pause
goto menu

:ver
cls
echo.
type %homedrive%ventas.txt
pause
goto menu


:ven
cls
echo  PROGRAMA DE VENTAS
echo   By Mr_bogey
echo ------------------------------
echo 
set /p vos= Articulo =
set /p v2= Precio =
set /p v3= Cantidad =
set /p v4= Cliente =
echo  Fecha  %DATE%  Hora:: %TIME%°°>>%homedrive%ventas.txt
echo Articulo    :%vos%>>%homedrive%ventas.txt
echo Precio  :%v2%>>%homedrive%ventas.txt
echo Cantidad     :%v3%>>%homedrive%ventas.txt
echo Cliente  :%v4%>>%homedrive%ventas.txt
echo ------------------------------------------------->>%homedrive%ventas.txt
echo Generado Correctamente
echo EL COBRO DE LA VENTA ES DE
set /a d1=v2*v3
echo %d1%
pause
goto men
 



:men
cls
echo.&&echo.
echo ----------------------------------
echo  COBRARSE %d1%
echo ----------------------------------
echo desea acer otra venta
echo COBRAR!(C)
echo  SI ( Y )
echo  NO ( N )
echo.
set /p o1= Elija una opcion :
if not defined o goto menu
if %o1%==Y (goto ven1)
if %o1%==N (goto menu) 
if %o1%==C (goto cobrar)


:cobrar
echo ----------------------------------
echo  COBRARSE %d1%
echo ----------------------------------
echo DIGITE LA CANTIDAD QUE RECIBIO
set /p num4=   RECIBO: 
set /a resu=%num4% - %d1%
pause
echo REPORTE DE VENTA
echo           Fecha  %DATE%  Hora:: %TIME% 
echo                    ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo                     º  TOTAL: %d1%      º
echo                     º                           º
echo                     º  EFECTIVO  %num4%   º
echo                     º                               º
echo                     º   CAMBIO %resu%   º
echo                     ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo NO OLVIDE ENTREGAR BIEN EL CAMBIO!!
goto cliente




:ven1
cls
echo.&&echo.
echo -----------------------------------------------------------------------
echo  COBRARSE %d1% DE LOS ARTICULOS ANTERIORES
echo ---------------------------------- ------------------------------------
echo  .
set /p vt= Articulo =
set /p vs= Precio =
set /p vd= Cantidad =
echo Cliente = %v4%
echo  Fecha  %DATE%  Hora:: %TIME%°°>>%homedrive%ventas.txt
echo Articulo    :%vt%>>%homedrive%ventas.txt
echo Precio  :%vs%>>%homedrive%ventas.txt
echo Cantidad     :%vd%>>%homedrive%ventas.txt
echo Cliente  :%v4%>>%homedrive%ventas.txt
echo ------------------------------------------------->>%homedrive%ventas.txt
echo generado correctamente
echo                      TOTAL DE ESTE ARTICULO
set /a f=vs*vd
echo .
echo                CALCULANDO...
pause 
echo                                   Total de estos articulos: %f% 
set /a total= %f% + %d1%
echo                                      Total de Todo %total%

echo  DIGITE EL
set /p total2=   EFECTIVO;
set  /a  fin=%total% - %total2%
echo
echo                  -------------------------------------------------------
echo              IMPRIMIENDO EN PANTALLA EL RECIBO  
echo --------------------------------------------------------------------------
pause
echo             °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°                 
echo             °Fecha :: %DATE%  Hora:: %TIME%°°
echo             °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
echo  ººººººººººººººººººººººººººººººººººººººººººººººººººººººººººº
echo  º cant º                         ºº  articulo    ºººººººººººººº                   
echo  º º %vd%----------                    %vt% ºººººººººººººº
echo  º º %v3% -------------                %vos% ºººººººººººº
echo  º
echo  º                                      --  ºTotal :  %total%º
echo  º                                         
echo  º                                       -- ºEfectivo: %total2%º
echo  º                                      
echo  º                                        --  ºCAMBIO ; %fin%º
echo  ºººººººººººººººººººººººººººººººººººººººººººººººººººººººººººº
echo .
echo                    *GRACIAS POR VISITAR LA TIENDA 
goto cliente



:cliente
echo.&&echo.
echo   ººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººººº
echo   ºººEL CLIENTE %v4% PODRIA NO ESTAR REGISTRADOººº
echo   ºEN LA BASE DE DATOS                         º       º
echo   ºººººººººººººººººOPCIONES: ººººººººººººººººº           º
echo   ººººººººº1.-Buscarlo                            º                º
echo   ºººººººººººººº2.- Agregar                       º              º
echo   ººººººººººººººººº3.- menuºººººººººººººººººººººººººººººººººººººº
set /p user= Digite Opcion 
if %user%== 1 (goto be)
if %user%== 2 (goto add1)
if %user%== 3 (goto menu)
if not defined  %user% goto cliente


:add1
cls
set /p dire= Direccion         =
set /p n= Numero               = 
set /p c= Compras en deudas   =
echo  Registro Fecha  %DATE%  Hora:: %TIME%°°>>%homedrive%clientes.txt
echo Cliente    :%v3%>>%homedrive%clientes.txt
echo Direccion  :%dire%>>%homedrive%clientes.txt
echo Numero     :%n%>>%homedrive%clientes.txt
echo Compras en deudas     :%c%>>%homedrive%clientes.txt
echo ------------------------------------------------->>%homedrive%clientes.txt
echo Generado Correctamente
pause
goto menu








:be
cls
 echo desea buscar  %v4%
setlocal enabledelayedexpansion
for /f "tokens=*" %%_ in ('find "%v4%" "%homedrive%clientes.txt" ') do (
   set "valor=%%_"
   echo El valor es : !valor!
)
pause
goto menu



