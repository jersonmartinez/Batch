@echo off
title Apareciendo
setlocal enabledelayedexpansion

set "var=apareciendo"

for /l %%a in (1,1,11) do (
echo !var:~0,%%a!
)
pause>nul