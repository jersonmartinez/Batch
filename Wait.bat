@echo off
title Game
set /p tiempo=Ingrese el tiempo de espera: 
for /l %%x in (1, 1, %tiempo%) do (
ping -n 2 0.0.0.0 > nul
echo %%x
)
echo Listo, han pasado %tiempo% segundos
for /l %%y in (1, 1, 1) do (
ping -n 2 0.0.0.0 > nul
)
exit