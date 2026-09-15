# Win-Drv-Backup

Win-Drv-Backup is a simple Windows utility for backing up installed third-party drivers and restoring them after reinstalling Windows.

It uses built-in Windows tools only:

- `DISM` for driver backup
- `PnPUtil` for driver restore

No third-party software is required.

---

## What This Tool Does

This project helps you save your current Windows driver packages and reinstall them later.

It is useful when you want to:

- Reinstall Windows
- Format the system drive
- Move to a new disk
- Recover from driver problems
- Keep a driver backup for your current system

The backup script exports third-party driver packages from the running Windows installation.

The restore script installs driver packages from the backup folder.

---

## Important Warning

By default, the backup folder is created here:

```text
C:\Backup_Driver
