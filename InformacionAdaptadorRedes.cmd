@ECHO OFF
:: WMI query to list all properties and values of the Win32_NetworkAdapterConfiguration class
:: This batch file was generated using the WMI Code Generator, Version 5.10
:: http://www.robvanderwoude.com/wmigen.php

IF "%~1"=="" (
	SET Node=%ComputerName%
) ELSE (
	SET Node=%~1
)

WMIC.EXE /Node:"%Node%" /Output:"Informacion Adaptador de redes.txt" Path Win32_NetworkAdapterConfiguration Where IPEnabled=TRUE Get DNSHostName, Description, IPAddress, IPSubnet, DefaultIPGateway, DNSServerSearchOrder, DHCPEnabled, MACAddress   /Format:LIST


REM /Output:STDOUT la muestra en pantalla

