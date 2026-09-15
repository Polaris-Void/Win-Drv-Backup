@echo off
setlocal enabledelayedexpansion
title Driver Restore Utility

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
echo               DRIVER RESTORE UTILITY               
echo ===================================================
echo.
[span_3](start_span):: --- Validate Backup Directory ---[span_3](end_span)
if not exist "%BACKUP_DIR%" (
    echo [ERROR] Backup directory not found at: %BACKUP_DIR%
    echo [ERROR] Please ensure the backup folder exists before restoring.
    goto :END
)

:: --- Execute Restore ---
echo [STATUS] Source Directory: %BACKUP_DIR%
echo [INFO] Restoring system drivers.
[span_4](start_span)echo Please wait...[span_4](end_span)
echo ---------------------------------------------------
pnputil /add-driver "%BACKUP_DIR%\*.inf" /subdirs /install
if !errorlevel! EQU 0 (
    echo ---------------------------------------------------
    echo [SUCCESS] Drivers restored successfully.
    echo [INFO] A system restart is recommended to apply changes.
) else (
    echo ---------------------------------------------------
    echo [ERROR] Driver restoration failed with exit code !errorlevel!.
)

:END
echo.
timeout /t 5
exit /b