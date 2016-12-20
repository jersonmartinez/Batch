@echo off
title Update Repository Server / Side Master
if not exist Voice (
	goto Installer
) else (
	goto Menu
)

:Menu
echo Este es el menu de opciones.

:Installer
echo Estoy en el otro punto

pause>nul
exit