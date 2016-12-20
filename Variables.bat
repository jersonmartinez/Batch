SET log=^> "%TEMP%\log.txt"

ECHO Hello, World %log%
pause>nul
TYPE "%TEMP%\log.txt"
pause>nul