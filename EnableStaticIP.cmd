:: (c) Norfipc 2010 - http://norfipc.com
:: Use at your own risk. No warranty express or implied.
:: Permission granted to copy, distribute and modify, provided 
:: this message is not removed.
:: Establecer la direccion IP en estatica.
@Echo OFF 
echo Para establecer tu direccion IP como estatica primero necesitas
echo conocer varios datos que tendras que ingresarlos manualmente:
echo.
echo Nombre de la conexion (Configuracion para la interfaz)
echo Si tu conexion tiene el nombre predeterminado: "Conexi¢n de  rea local" 
echo no necesitas ingresarlo, solo oprime Enter cuando se te pida,
echo anota la la mascara de subred,
echo la puerta de enlace predeterminada,
echo y es opcional la direccion IP de un servidor DNS.
echo Ten presente que la direccion IP que vayas a establecer
echo tiene que estar en el mismo rango que el valor de la puerta de enlace.
echo si tienes dudas solo sumale dos numeros al IP de la puerta de enlace.
echo.
echo esos datos se van a mostrar a continuacion
echo copialos y despues oprime cualquier tecla.
echo.
echo Continuar?
pause>nul
cls
netsh interface ip show config 
pause
cls
set/p conex=Escribe el nombre de la conexion y oprime Enter
set/p ip=Escribe la direccion IP que vas a asignar y oprime Enter
set/p ms=Escribe el valor de la mascara de subred y oprime Enter
set/p pe=Escribe el valor de la puerta de enlace y oprime Enter
set/p dns=Escribe el valor de el servidor DNS y oprime Enter

cls
If [%conex%] == [] set/p conex="Conexi¢n de  rea local"
If [%ip%] == [] GOTO QUIT 
If [%ms%] == [] GOTO QUIT 
If [%pe%] == [] GOTO QUIT 

 
Echo Estableciendo la direccion IP en %ip% 
echo con la mascara de subred en %ms% 
echo y la puerta de enlace %pe%
netsh interface ip set address name="Conexi¢n de  rea local" static %ip% %ms% %pe% 1

  
If [%dns%] == [] GOTO QUIT 
Echo Estableciendo el servidor DNS en %dns% 
netsh interface ip set dnsservers name="Conexi¢n de  rea local" source=static addr=%dns% register=primary validate=no
 
GOTO QUIT 
 
:QUIT 
msg * Hecho, tu direccion IP ahora es estatica.
msg * Puedes encontrar mas scripts utiles en http://norfipc.com 
exit
pause>nul