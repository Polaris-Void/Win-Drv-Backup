# WinDrvBackup

[![Platform](https://img.shields.io/badge/Platform-Windows%208.1%20%7C%2010%20%7C%2011-0078D6?logo=windows&logoColor=white)](https://microsoft.com/windows)
[![Shell](https://img.shields.io/badge/Language-Windows%20Batch-4EAA25?logo=gnubash&logoColor=white)](#)
[![Dependencies](https://img.shields.io/badge/Dependencies-Zero%20(100%25%20Native)-success)](#)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

A lightweight, zero-dependency, and fully auditable Windows utility to back up and restore third-party (OEM) hardware drivers natively using official Microsoft servicing tools (**DISM** and **PnPUtil**).

No bloatware, no third-party background agents, no closed-source installers — 100% clean and transparent.

---

## ⚡ Highlights

* **100% Native Implementation:** Utilizes Windows built-in servicing frameworks (`dism.exe` & `pnputil.exe`).
* **OEM Filtering:** Automatically extracts only third-party and OEM driver packages. Windows default inbox drivers are ignored to keep backup sizes minimal.
* **Recursive Hardware Matching:** Restores and stages all `.inf` driver trees recursively across subfolders.
* **Auto-Elevation:** Transparently prompts for Administrator privileges (UAC) via a lightweight, profile-safe PowerShell invocation.
* **Zero Runtime Overhead:** Does not require Python, .NET runtimes, or compiled executables.

---

## 📁 Repository Structure

```text
WinDrvBackup/
├── Backup-Drivers.bat    # Exports third-party drivers to the backup location
├── Restore-Drivers.bat   # Stages and reinstalls drivers recursively
├── .gitignore            # Git exclusions for temporary files and local backups
├── LICENSE               # Apache License 2.0
└── README.md             # Project documentation