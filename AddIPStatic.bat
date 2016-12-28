@echo off
Netsh interface ip set address name="Wifi" source=static addr=192.168.0.2 mask=255.255.255.0 gateway=192.168.0.1 gwmetric=1
