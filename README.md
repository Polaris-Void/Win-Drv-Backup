<div align="center">

# 🛡️ WinDrv-Backup
### Enterprise-Grade, Zero-Dependency Windows Driver Backup & Restore Engine

[![Platform](https://img.shields.io/badge/Platform-Windows%208.1%20%7C%2010%20%7C%2011%20%7C%20Server-0078D6?logo=windows&logoColor=white)](https://microsoft.com/windows)
[![Architecture](https://img.shields.io/badge/Architecture-x64%20%7C%20x86%20%7C%20ARM64-lightgrey)](#system-requirements)
[![Language](https://img.shields.io/badge/Language-Windows%20Batch%20%2F%20CMD-4EAA25?logo=gnubash&logoColor=white)](#)
[![Dependencies](https://img.shields.io/badge/Dependencies-Zero%20(100%25%20Native)-brightgreen)](#)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-Yes-success.svg)](#)

<p align="center">
  A transparent, lightweight, and auditable automation suite designed to reliably extract, stage, and reinstall third-party OEM hardware drivers on Windows systems using native Microsoft deployment binaries (<b>DISM</b> and <b>PnPUtil</b>).
</p>

[Key Features](#-key-features) •
[Why WinDrv-Backup?](#-why-windrv-backup-vs-alternatives) •
[How It Works](#-architecture--mechanics) •
[Usage Guide](#-step-by-step-usage-guide) •
[Configuration](#️-configuration--customization) •
[Troubleshooting](#-troubleshooting--error-handling) •
[License](#-license--legal)

</div>

---

## 📑 Table of Contents
- [Executive Overview](#-executive-overview)
- [Key Features](#-key-features)
- [Why WinDrv-Backup? (vs. Alternatives)](#-why-windrv-backup-vs-alternatives)
- [Architecture & Mechanics](#-architecture--mechanics)
  - [Driver Export Pipeline (DISM)](#1-driver-export-pipeline-dism)
  - [Driver Staging & Restoration Pipeline (PnPUtil)](#2-driver-staging--restoration-pipeline-pnputil)
  - [Safe Privilege Escalation (Auto-Elevation)](#3-safe-privilege-escalation-auto-elevation)
- [System Requirements](#-system-requirements)
- [Repository Structure](#-repository-structure)
- [Step-by-Step Usage Guide](#-step-by-step-usage-guide)
  - [Scenario A: Creating a Clean Driver Snapshot](#scenario-a-creating-a-clean-driver-snapshot)
  - [Scenario B: Restoring Drivers on a Fresh Windows Installation](#scenario-b-restoring-drivers-on-a-fresh-windows-installation)
  - [Scenario C: Backing Up to an External Storage Drive](#scenario-c-backing-up-to-an-external-storage-drive)
- [Configuration & Customization](#️-configuration--customization)
- [Troubleshooting & Error Handling](#-troubleshooting--error-handling)
- [Security, Privacy & Auditability](#-security-privacy--auditability)
- [Frequently Asked Questions (FAQ)](#-frequently-asked-questions-faq)
- [License & Legal](#-license--legal)
- [Author & Acknowledgments](#-author--acknowledgments)

---

## 📌 Executive Overview

Maintaining hardware drivers across system migrations, bare-metal re-installations, or recovery operations is traditionally plagued by two extremes:
1. **Unsafe Third-Party Software:** Driver updaters and utility suites often bundle adware, background telemetry agents, cryptominers, or download generic/mismatched driver packages that cause fatal Blue Screens of Death (BSOD).
2. **Cumbersome Manual Backups:** Finding individual vendor INF packages from device manager entries across dozens of OEMs (Intel, Realtek, Nvidia, AMD, Synaptics) is error-prone and time-consuming.

**WinDrv-Backup** solves this problem by providing a deterministic, dual-script automation layer over native Windows administrative tools:
* It selectively extracts **all working, third-party OEM drivers** already verified and active on the machine.
* It safely restores them in batch mode during post-installation without requiring internet connectivity or third-party executable runtimes.

---

## ⚡ Key Features

* **100% Native & Auditable:** Zero compiled binaries (`.exe`), zero obscure DLLs. Built entirely on standard Windows Batch scripting and native servicing tools.
* **Intelligent OEM Filtering:** Leverages DISM's internal driver filtering engine. Default Windows *inbox drivers* are intentionally excluded, keeping backup archives compact, clean, and free of redundant system files.
* **Recursive Hardware Discovery & Staging:** Utilizes Microsoft `PnPUtil` to traverse deeply nested subdirectories, inject `.inf` definitions into the active Driver Store, and match devices in real time.
* **Fail-Safe UAC Auto-Elevation:** Automatically detects whether administrative privileges are present. If missing, it requests elevation via a clean, profile-safe PowerShell invocation (`-NoProfile -ExecutionPolicy Bypass`).
* **Completely Offline:** Functions with zero internet dependency—ideal for air-gapped workstations, corporate IT environments, and post-clean-install environments without network interface card (NIC) drivers.
* **Predictable Directory Management:** Safely creates target paths dynamically and handles system drive variables (`%SystemDrive%`) across non-standard drive configurations.

---

## 📊 Why WinDrv-Backup? (vs. Alternatives)

| Evaluation Metric | WinDrv-Backup | Third-Party "Driver Tools" | Manual Vendor Downloads | Windows Update |
| :--- | :---: | :---: | :---: | :---: |
| **Telemetry & Spyware** | **None (0%)** | ⚠️ High (Often Bundled) | None | Medium |
| **Offline Capability** | **100% Offline** | ❌ Requires Internet | ❌ Requires Internet | ❌ Requires Internet |
| **Execution Overhead** | **Instant (Batch)** | Heavy (>100MB Installers) | Manual Search | Background Services |
| **Exact Hardware Matching** | **Exact Active OEM** | Generic / Hit-or-Miss | Exact | Generic Microsoft Signed |
| **Auditability** | **Plain Text Code** | Closed Binary Payload | Binary Installers | Closed System |
| **Licensing** | **Apache 2.0 (FOSS)** | Proprietary / Commercial | Proprietary | Microsoft EULA |

---

## 🔬 Architecture & Mechanics

### Workflow Diagram

```text
[ Backup Process ]
User Execution
      │
      ▼
Check Admin Privileges? ────(No)───► Request UAC Elevation via PowerShell
      │ (Yes)
      ▼
Initialize Target Directory (%SystemDrive%\Backup_Driver)
      │
      ▼
Invoke DISM Engine (/online /export-driver)
      │
      ▼
Filter & Extract Active Third-Party INF / SYS / CAT Packages
      │
      ▼
Complete Driver Snapshot Saved

─────────────────────────────────────────────────────────────

[ Restore Process ]
User Execution (Fresh OS or Recovery State)
      │
      ▼
Check Admin Privileges? ────(No)───► Request UAC Elevation via PowerShell
      │ (Yes)
      ▼
Verify Target Directory Existence
      │
      ▼
Invoke PnPUtil Engine (/add-driver *.inf /subdirs /install)
      │
      ▼
Stage Driver Packages into Windows Driver Store
      │
      ▼
Hardware Binding & Device Association Completed
