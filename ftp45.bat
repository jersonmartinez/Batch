@echo off
title Ciclo FOR
echo Ingrese el nombre del fichero que decea buscar!.
echo ------------------------------------------------
msg * Listo!!.
At 15:39 msg * Son Las 8 de la noche
set /p wait=Esperando Respuesta:
FOR %%x in (%wait%*) DO echo %%x
pause>nul
FOR /R %%y in (*.jpg) DO echo %%y
echo Abrir FTP
echo ---------
pause>nul
@ftp -i -s:"%~f0"&GOTO:EOF
open 31.170.160.88
a2688484
Quepaso01
dir
cd /public_html
dir
cd /forbidden
dir
cd /filesactive
bye
pause>nul
echo Side Master
pause>nul