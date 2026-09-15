# Win-Drv-Backup

A clean, native, and zero-dependency solution to backup and restore all third-party Windows drivers using built-in system tools (`DISM` and `PnpUtil`).

No third-party software, no installers, no external scripts, and no background services.

---

## 📌 Table of Contents
1. [Why Use This Tool?](#why-use-this-tool)
2. [How It Works](#how-it-works)
3. [⚠️ Critical Warning: Read Before Formatting](#️-critical-warning-read-before-formatting)
4. [Complete Step-by-Step Tutorial](#complete-step-by-step-tutorial)
   - [Phase 1: Taking the Backup](#phase-1-taking-the-backup)
   - [Phase 2: Saving to an External Drive (USB)](#phase-2-saving-to-an-external-drive-usb)
   - [Phase 3: Installing Clean Windows](#phase-3-installing-clean-windows)
   - [Phase 4: Restoring Drivers](#phase-4-restoring-drivers)
5. [Alternative Restoration Methods](#alternative-restoration-methods)
6. [What Gets Backed Up?](#what-gets-backed-up)
7. [Troubleshooting & Common Questions](#troubleshooting--common-questions)
8. [Compatibility](#compatibility)

---

## Why Use This Tool?

Commercial driver updater and backup tools often install adware, collect telemetry, run unwanted background services, or back up incompatible files. 

**Win-Drv-Backup** solves this problem safely:
- **100% Native:** Runs exclusively on standard Windows components (`DISM.exe` and `pnputil.exe`).
- **Zero Dependencies:** Does not require Python, PowerShell modules, runtimes, or an active internet connection.
- **Clean & Fast:** Backs up only installed OEM/hardware drivers (excluding huge default Microsoft inbox drivers).
- **Fully Auditable:** Both batch scripts can be opened and inspected directly in Notepad.

---

## How It Works

Windows provides two official administrative tools to handle device drivers:

1. **DISM (Deployment Image Servicing and Management):**  
   The `backup.bat` script runs:
   ```cmd
   dism /online /export-driver /destination:"C:\Backup_Driver"
