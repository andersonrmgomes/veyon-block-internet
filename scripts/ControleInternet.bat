@echo off
REM Script para bloquear ou liberar Internet externa
REM Uso: ControleInternet.bat bloquear
REM       ControleInternet.bat liberar

set ACTION=%1
set LAN=10.111.9.0/24

if "%ACTION%"=="bloquear" (
    
    netsh advfirewall firewall add rule name="PermitirLAN" dir=out action=allow remoteip=%LAN%
    netsh advfirewall firewall add rule name="PermitirLocalhost" dir=out action=allow remoteip=127.0.0.1
    netsh advfirewall firewall add rule name="BloquearInternet" dir=out action=block enable=yes
) else if "%ACTION%"=="liberar" (
   
    netsh advfirewall firewall delete rule name="BloquearInternet"
    netsh advfirewall firewall delete rule name="PermitirLAN"
    netsh advfirewall firewall delete rule name="PermitirLocalhost"
) else (
    echo Uso: %0 bloquear|liberar
)
