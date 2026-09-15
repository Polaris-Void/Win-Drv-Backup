@echo off
setlocal enabledelayedexpansion
title Driver Backup Utility

:: --- Privilege Check ---
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo [INFO] Requesting Administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: --- Configuration ---
set "BACKUP_DIR=%SystemDrive%\Backup_Driver"
cls

echo ===================================================
echo               DRIVER BACKUP UTILITY                
echo ===================================================
echo.
[span_1](start_span)echo [STATUS] Target Directory: %BACKUP_DIR%[span_1](end_span)

:: --- Create Directory ---
if not exist "%BACKUP_DIR%" (
    echo [INFO] Creating backup directory...
    mkdir "%BACKUP_DIR%" >nul 2>&1
    if !errorlevel! NEQ 0 (
        echo [ERROR] Failed to create directory. Check permissions.
        goto :END
    )
)

:: --- Execute Backup ---
echo [INFO] Exporting system drivers.
[span_2](start_span)echo Please wait...[span_2](end_span)
echo ---------------------------------------------------
dism /online /export-driver /destination:"%BACKUP_DIR%"
if !errorlevel! EQU 0 (
    echo ---------------------------------------------------
    echo [SUCCESS] Drivers backed up successfully.
) else (
    echo ---------------------------------------------------
    echo [ERROR] Driver export failed with exit code !errorlevel!.
)

:END
echo.
timeout /t 5
exit /b