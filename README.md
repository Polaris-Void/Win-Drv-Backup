<p align="right">
  <a href="README_FA.md"> <strong>فارسی</strong></a>
</p>

---

# Windows Driver Backup & Restore Utility

A lightweight, automated Windows batch utility designed to back up and restore OEM drivers using native command-line tools (**DISM** and **PnPUtil**).

Zero third-party software required — 100% native, clean, and reliable.

---

## ✨ Features

- **🛠️ 100% Native:** Relies exclusively on built-in Windows utilities (`DISM` and `PnPUtil`).
- **🔑 Auto-Elevation:** Automatically requests administrative privileges via UAC if not launched as Administrator.
- **📦 OEM Driver Isolation:** Backs up only installed third-party drivers, ignoring standard inbox Windows drivers to save disk space.
- **🔄 Batch Restoration:** Recursively installs and restores all drivers from subdirectories in a single operation.
- **🎨 Clean Terminal Output:** Formatted CLI interface with explicit status tags (`[INFO]`, `[SUCCESS]`, `[ERROR]`).
- **🛡️ Safe & Robust:** Built-in path validation, directory existence checks, and dynamic variable handling.

---

## 📋 System Requirements

- **Operating System:** Windows 8.1 / Windows 10 / Windows 11 (32-bit & 64-bit).
- **Permissions:** Administrator privileges (handled automatically).
- **PowerShell:** Required for automatic UAC elevation.

---

## 🚀 How to Use

### 1. Back Up Drivers
1. Run **`Backup-Drivers.bat`**.
2. Accept the UAC prompt if prompted.
3. The script will automatically export all OEM drivers into `C:\Backup_Driver`.

### 2. Restore Drivers
1. Ensure the driver backup directory is located at `C:\Backup_Driver`.
2. Run **`Restore-Drivers.bat`**.
3. Accept the UAC prompt if prompted.
4. The script will recursively scan and install all `.inf` driver packages.
5. **Reboot your system** after the restoration is complete.

---

## ⚙️ Configuration

By default, drivers are backed up to and restored from:

```cmd
C:\Backup_Driver
