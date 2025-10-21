# Windows OOBE Bypass

This batch script modifies Windows registry settings and schedules temporary tasks to simplify the Out-of-Box Experience (OOBE) setup process.  
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
  - Run `ipconfig /renew` on logon
  - Delete the temporary OOBE registry keys after logon

---

## Notes

- Must be run with **administrator privileges**.
- Works on Windows 25H2 (not tested on Dev).

---

## How to run the script from OOBE

1. At the region selection screen, press **Shift + F10** to open a command prompt.
2. Type: `explorer` and press Enter.
3. In File Explorer, locate the script, right-click it, and choose **Run as administrator**.
4. You can copy the script to a USB drive first and run it from there.
5. Or run it directly from the command prompt by typing the full path, for example: `E:\\OOBE.bat`
