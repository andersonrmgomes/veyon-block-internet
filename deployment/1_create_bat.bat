@echo off
setlocal

:: Pasta de scripts
set "SCRIPT_DIR=C:\Scripts"

:: Cria pasta se não existir
if not exist "%SCRIPT_DIR%" (
    mkdir "%SCRIPT_DIR%"
)
copy ControleInternet.bat c:\Scripts
