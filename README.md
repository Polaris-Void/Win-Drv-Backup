<div align="center">

![Platform](https://img.shields.io/badge/platform-Windows%2010%20%7C%2011-0078D6?logo=windows&logoColor=white)

English | [فارسی](README.FA.md)

</div>

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

C:\Backup_Driver

---

## ⚖️ Absolute Legal Disclaimer, Waiver & Limitation of Liability

This project is licensed under the **Apache License, Version 2.0**. This disclaimer expressly supplements, expands, and reinforces **Section 7 (Disclaimer of Warranty)** and **Section 8 (Limitation of Liability)** of the Apache License 2.0, and shall control to the maximum extent permitted by applicable law.

**FOR EDUCATIONAL, RESEARCH, AND INFORMATIONAL PURPOSES ONLY. NO COMMERCIAL WARRANTY OR LIABILITY IS ASSUMED.**

### 1. Complete Disclaimer of All Warranties
To the maximum extent permitted by applicable law, the Software (including all code, documentation, data, and related materials) is provided strictly on an **"AS IS"** and **"AS AVAILABLE"** basis, without any warranties or conditions of any kind, whether express, implied, statutory, customary, or otherwise. This includes, without limitation, any warranties of merchantability, fitness for a particular purpose, non-infringement, title, security, accuracy, completeness, uninterrupted or error-free operation, or freedom from viruses or other harmful components. The author(s), copyright holder(s), maintainer(s), and contributor(s) expressly disclaim all such warranties.

### 2. Absolute Limitation of Liability
Under no circumstances and under no legal theory (whether in contract, tort — including negligence, gross negligence, and willful misconduct — strict liability, product liability, or otherwise) shall the author(s), maintainer(s), contributor(s), or copyright holder(s) be liable for any damages whatsoever, including but not limited to direct, indirect, incidental, special, consequential, exemplary, punitive, or any other damages (including loss of data, profits, revenue, business interruption, system failure, hardware damage, security breaches, personal injury, or any other loss), arising out of or related to the use, inability to use, modification, distribution, or reliance upon the Software, even if advised of the possibility of such damages and even if any remedy fails of its essential purpose.

### 3. Assumption of All Risk & User Responsibility
Any use, cloning, modification, deployment, distribution, or reliance upon this Software is undertaken entirely at the user’s sole risk and discretion. The user is exclusively and solely responsible for:
- Ensuring full compliance with all applicable local, national, and international laws, regulations, export controls, and third-party terms;
- Evaluating the suitability, security, and legality of the Software for any purpose;
- Any consequences arising from its use or misuse.

Nothing in this repository constitutes legal, financial, cybersecurity, medical, architectural, or any other form of professional advice.

### 4. Broad Indemnification
By accessing, downloading, cloning, forking, viewing, compiling, distributing, or using any part of this repository, you irrevocably agree to indemnify, defend, and hold harmless the author(s), contributor(s), and copyright holder(s) from and against any and all claims, demands, actions, proceedings, liabilities, damages, losses, costs, and expenses (including reasonable attorneys’ fees and legal costs) arising out of or related to your access, use, misuse, modification, distribution, or violation of this disclaimer or any applicable law.

### 5. Severability & Maximum Enforceability
If any provision of this disclaimer is held to be unenforceable or invalid under applicable law, such provision shall be modified to the minimum extent necessary to make it enforceable, or if modification is not possible, severed. The remaining provisions shall continue in full force and effect. This disclaimer shall be interpreted to provide the maximum protection permitted by law.

### 6. No Waiver of Non-Waivable Rights
Nothing in this disclaimer is intended to exclude or limit any liability that cannot be excluded or limited under applicable mandatory law (including liability for death or personal injury caused by negligence in jurisdictions where such exclusion is prohibited). In such cases, liability is limited to the maximum extent permitted by law.
