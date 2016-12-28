@echo off

rem --- complete adapter name to find without the ending ":" ---
set adapter=Wireless LAN adapter Wireless Network Connection

rem --- token under an adapter to extract IP address from ---
set IPAddrToken=IPv4 Address

setlocal enableextensions enabledelayedexpansion
set adapterfound=false
set emptylines=0
set ipaddress=

for /f "usebackq tokens=1-3 delims=:" %%e in (`ipconfig ^| findstr /n "^"`) do (

    set "item=%%f"

    if /i "!item!"=="!adapter!" (
        set adapterfound=true
        set emptylines=0
    ) else if not "!item!"=="" if not "!item!"=="!item:%IPAddrToken%=!" if "!adapterfound!"=="true" (
        @rem "!item:%IPAddrToken%=!" --> item with "IPv4 Address" removed
        set ipaddress=%%g
        goto :result
    )
    if "%%f-%%g-!adapterfound!-!emptylines!"=="--true-1" (
        @rem 2nd blank line after adapter found
        goto :result
    )
    if "%%f-%%g-!adapterfound!-!emptylines!"=="--true-0" (
        @rem 1st blank line after adapter found
        set emptylines=1
    )
)

endlocal

:result
    echo %adapter%
    echo.
    if not "%ipaddress%"=="" (
        echo    %IPAddrToken% =%ipaddress%
    ) else (
        if "%adapterfound%"=="true" (
            echo    %IPAddrToken% Not Found
        ) else (
            echo    Adapter Not Found
        )
    )
    echo.

pause