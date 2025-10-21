# Windows OOBE Bypass

This batch script modifies Windows registry settings and schedules temporary tasks to simplify the Out-of-Box Experience (OOBE) setup process. Disabling need for a Microsoft Account.
This is a simplified version that **does not use unattend.xml** or any other automated setup tools.

---

## What it does

- **Releases the IP address** to reset the network adapter so Windows detects no internet connection during OOBE.

- **Sets OOBE registry values to:**
  - Bypass network requirement (BypassNRO)
  - Hide online account setup screens
  - Hide wireless setup prompts
  - Disable the first logon animation

- **Creates scheduled tasks that:**
  - Run `ipconfig /renew` on logon (Restores Internet Connection)
  - Delete the temporary OOBE registry keys after logon

---

## Notes

- Must be run with **administrator privileges**.
- Works on Windows 25H2 (not tested on Dev).

---

## How to run the script from OOBE

1. Copy the script to a USB drive first.
1. At the region selection screen, press **Shift + F10** to open a command prompt **OR** **FN Shift + F10** if you’re on a laptop.
2. Type: `explorer` and press Enter.
3. In File Explorer, locate the script, right-click it, and choose **Run as administrator**. Or run it directly from the command prompt by typing the full path, for example: `E:\\OOBE.bat`
4. Continue OOBE without needing to sign in with a Microsoft account :)
