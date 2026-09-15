# WinDrv-Backup

[![Platform](https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011-0078D6?logo=windows&logoColor=white)](https://microsoft.com/windows)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Dependencies](https://img.shields.io/badge/Dependencies-Zero%20(Native)-success)](#)

A simple, reliable, and 100% native Windows utility to **back up all your installed hardware drivers** before reinstalling Windows, and **restore them with a single click**.

No third-party software. No internet needed. No bloatware.

---

## 📌 Why Use This?

When you reinstall Windows, your Wi-Fi, sound, or graphics drivers are often missing. Finding them manually from manufacturer websites takes hours.

**WinDrv-Backup** solves this:
* It extracts **all working drivers** already on your PC into a single folder.
* After reinstalling Windows, you run one script and all drivers are installed automatically.
* It uses official, built-in Windows tools (**DISM** and **PnPUtil**) — completely safe and clean.

---

## 💻 Requirements

* **OS:** Windows 10, Windows 11, or Windows 8.1 (64-bit or 32-bit).
* **Permissions:** Administrator rights (the script asks for permission automatically).

---

## 📁 What's Inside?

```text
WinDrv-Backup/
├── Backup-Drivers.bat    <-- Run this to BACK UP your drivers
├── Restore-Drivers.bat   <-- Run this to RESTORE your drivers
├── .gitignore
├── LICENSE
└── README.md
