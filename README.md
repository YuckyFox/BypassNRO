# Windows OOBE Bypass

This batch script modifies Windows registry settings and schedules temporary tasks to simplify the Out-of-Box Experience (OOBE) setup process.

## What it does

Releases the IP address to reset the network adapter so Windows detects no internet connection during OOBE.

# Sets OOBE registry values to:
Bypass network requirement (BypassNRO)
Hide online account setup screens
Hide wireless setup prompts
Disable the first logon animation

# Creates scheduled tasks that:
Run ipconfig /renew on logon.
Delete the temporary OOBE registry keys after logon cleanup.

## Notes
Must be run with administrator privileges.
To run the script from OOBE:
At the region selection screen press Shift+F10 to open a command prompt.
Type explorer and press Enter.
In File Explorer locate the script, right-click it and choose Run as administrator.
You can copy the script to a USB drive first and run it from there.
Or run it directly from the command prompt by typing the full path, for example: E:\OOBE.bat.

Works on 25H2 (Didn't checked dev)
