@echo off
set serv=ftp.sidemasters.com
set usua=sidemasters.com
set cont=Inform@tico
set carp=Folder
::tipo de subida binary o ascii
set tipo=binary
 
%~d1
cd "%~s1"
::config
(
echo %usua%
echo %cont%
echo cd %carp%
echo %tipo%
)>%temp%\put.txt
goto u
:file
for %%x in (*.*) do echo put %%~sx>>%temp%\put.txt
goto:eof
:u
call :file
for /r /d %%y in (*) do (
echo mkdir "%%~ny">>%temp%\put.txt
echo cd "%%~ny">>%temp%\put.txt
cd %%~sy
call :file
)
echo quit>>%temp%\put.txt
ftp -i -s:%temp%\put.txt %serv%
pause