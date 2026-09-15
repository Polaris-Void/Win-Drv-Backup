# Windows Driver Backup & Restore Utility

A lightweight, automated, and batch-script-based utility for backing up and restoring OEM drivers on Windows operating systems using native command-line tools (**DISM** and **PnPUtil**).

No third-party software required — 100% native, clean, and reliable.

---

## ✨ Features

- 🛠 **100% Native:** Uses built-in Windows utilities (`DISM` & `PnPUtil`).
- 🔑 **Auto-Elevation:** Automatically requests Administrator privileges (UAC prompt) if not run as admin.
- 📦 **OEM Driver Export:** Backs up third-party drivers while safely ignoring standard Windows inbox drivers.
- 🔄 **Batch Restoration:** Scans all subdirectories and installs drivers recursively.
- 🎨 **Clean CLI Interface:** Styled terminal output with status tags (`[INFO]`, `[SUCCESS]`, `[ERROR]`).
- 🛡 **Safe & Reliable:** Includes directory checks and dynamic variable handling.

---

## 📋 System Requirements

- **OS:** Windows 8.1, Windows 10, or Windows 11 (64-bit / 32-bit)
- **Privileges:** Administrator access (handled automatically by the script)
- **PowerShell:** Required for UAC auto-elevation

---

## 🚀 How to Use

### 1. Back Up Drivers
1. Download or clone this repository.
2. Double-click **`Backup Drivers.bat`**.
3. Accept the UAC prompt if requested.
4. The script will create a directory at `C:\Backup_Driver` and export all OEM drivers into it.

### 2. Restore Drivers
1. Ensure your backup folder exists at `C:\Backup_Driver` (or change the directory inside the script).
2. Double-click **`Restore Drivers.bat`**.
3. Accept the UAC prompt if requested.
4. The script will scan all `.inf` files and install/stage them automatically.
5. **Restart your computer** after the restoration completes.

---

## ⚙️ Configuration

By default, drivers are backed up to and restored from:
```cmd
C:\Backup_Driver
