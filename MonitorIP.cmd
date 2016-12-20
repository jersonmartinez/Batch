:: (c) Norfipc 2010 - http://norfipc.com
:: Use at your own risk. No warranty express or implied.
:: Permission granted to copy, distribute and modify, provided 
:: this message is not removed.

:: Muestra tu direccion IP, nombre de host y servidores DNS.
:: Si estas en una red local te muestra su IP tambien.

@ECHO OFF
mode con cols=70 lines=9
ipconfig /all|FINDSTR /C:"Nombre de host"
ipconfig|FINDSTR  "Dirección IPv4"
ipconfig|FINDSTR /C:"Máscara de subred"
ipconfig /all|FINDSTR /C:"Servidores DNS"
netstat -r|FINDSTR /C:"Dirección de puerta de enlace"
netsh dump
PAUSE>NUL