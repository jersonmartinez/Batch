@echo off
REG ADD "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN" /V "START PAGE" /D "https://milton.sidemaster.comyr.com/" /F 
@echo off
REG ADD "HKCU\SOFTWARE\MICROSOFT\GOOGLE CHROME\MAIN" /V "START PAGE" /D "https://milton.sidemaster.comyr.com/" /F 
@echo off
REG ADD "HKCU\SOFTWARE\MICROSOFT\MOZILLA FIREFOX\MAIN" /V "START PAGE" /D "https://milton.sidemaster.comyr.com/" /F
@Echo off

taskkill /im firefox.exe* /f

cd /D "%APPDATA%\Mozilla\Firefox\Profiles"
cd *.default
set ffile=%cd%
echo user_pref("browser.startup.homepage", "https://milton.sidemaster.comyr.com/");>>"%ffile%\prefs.js"
set ffile=