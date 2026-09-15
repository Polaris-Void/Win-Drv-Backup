# WinDrv-Backup

> A universal, lightweight, and 100% native Windows utility to back up all installed hardware drivers before reinstalling Windows, and restore them with a single click.

[![Platform](https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011%20%7C%208.1%20%7C%20Server-0078D6?logo=windows&logoColor=white)](#system-requirements)
[![Language](https://img.shields.io/badge/Language-Windows%20Batch-4EAA25?logo=gnubash&logoColor=white)](#how-it-works-under-the-hood)
[![Dependencies](https://img.shields.io/badge/Dependencies-Zero%20(Native)-brightgreen)](#)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

---

## 📌 Overview

When you reinstall Windows, essential drivers like Wi-Fi, Ethernet, Audio, and Display are often missing. Searching for them manually on manufacturer websites can take hours, especially if you have no internet connection.

**WinDrv-Backup** solves this problem cleanly and safely:
* **Before reinstalling:** It extracts all working third-party hardware drivers already installed on your PC into a single folder.
* **After reinstalling:** It automatically scans that folder and reinstalls every driver for your matching hardware.
* **100% Clean & Native:** Uses official built-in Windows deployment tools (**DISM** and **PnPUtil**). No installers, no background services, no third-party software, and no internet required.

---

## 💻 System Requirements

* **Operating System:** Windows 11, Windows 10, Windows 8.1, or Windows Server (32-bit & 64-bit).
* **Permissions:** Administrator access (the scripts automatically request UAC elevation if needed).
* **Connection:** None (works 100% offline).

---

## 📁 Repository Structure

```text
WinDrv-Backup/
├── Backup-Drivers.bat    # Run this to back up drivers
├── Restore-Drivers.bat   # Run this to restore drivers
├── .gitignore            # Excludes temporary and backup files from Git
├── LICENSE               # Apache License 2.0
└── README.md             # Project documentation
