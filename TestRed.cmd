:: (c) Norfipc 2010 - http://norfipc.com
:: Use at your own risk. No warranty express or implied.
:: Permission granted to copy, distribute and modify, provided 
:: this message is not removed.

:: Comprueba cada 30 segundos si tiene conexion, si estas conectado te muestra tu IP.

@ECHO OFF
color 0E
mode con cols=70 lines=8
: START
SET CONNECT=SI
PING 72.14.204.147 | FIND "TTL=" > NUL
IF NOT ERRORLEVEL 1 GOTO SI
IF ERRORLEVEL 1 SET CONNECT=NO

ECHO %CONNECT% tienes conexion a internet en este momento
PING 1.1.1.1 -n 2 -w 30000 >NUL
CLS
GOTO START
pause>nul
EXIT

:SI
ECHO Estas conectado a internet
ECHO Tu direccion IP es: 
ipconfig|FINDSTR  "Dirección IPv4"
PING 1.1.1.1 -n 2 -w 30000 >NUL
CLS
GOTO START
pause>nul