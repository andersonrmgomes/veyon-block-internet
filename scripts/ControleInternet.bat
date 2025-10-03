@echo off
REM ==========================================================
REM Script: ControleInternet.bat
REM Autor: Anderson Gomes
REM Descrição: Bloqueia ou libera acesso à Internet externa,
REM            mantendo o acesso à rede local.
REM Uso: ControleInternet.bat bloquear
REM       ControleInternet.bat liberar
REM Observações:
REM   - O script permite acesso à LAN definida na variável LAN
REM   - Sempre mantém o localhost (127.0.0.1) liberado
REM ==========================================================

REM Define a ação a ser executada (bloquear ou liberar)
set ACTION=%1
REM Define a faixa de IP da LAN que será sempre permitida
set LAN=10.111.9.0/24

REM ===============================================
REM Bloquear Internet externa (permitindo LAN)
REM ===============================================
if "%ACTION%"=="bloquear" (
    
    netsh advfirewall firewall add rule name="PermitirLAN" dir=out action=allow remoteip=%LAN%
    netsh advfirewall firewall add rule name="PermitirLocalhost" dir=out action=allow remoteip=127.0.0.1
    netsh advfirewall firewall add rule name="BloquearInternet" dir=out action=block enable=yes
) else if "%ACTION%"=="liberar" (
    REM ===============================================
    REM Remove regras para liberar acesso à Internet
    REM ===============================================
    netsh advfirewall firewall delete rule name="BloquearInternet"
    netsh advfirewall firewall delete rule name="PermitirLAN"
    netsh advfirewall firewall delete rule name="PermitirLocalhost"
) else (
    REM Se nenhum parâmetro válido for passado
    echo Uso: %0 bloquear|liberar
)
