:: (c) Norfipc 2010 - http://norfipc.com
:: Use at your own risk. No warranty express or implied.
:: Permission granted to copy, distribute and modify, provided 
:: this message is not removed.

:: Reemplaza el archivo hosts por una copia llamada hosts.new 
:: Para eso primero tienes que crear dicha copia.

@echo off
echo Asegurate de tener la copia de respaldo llamada hosts.new
echo para reemplazar el archivo hosts original por ella.
echo.
pause
pushd "%systemroot%\system32\drivers\etc"
copy "%cd%\hosts.new" "%cd%\hosts"
PAUSE