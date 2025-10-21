@echo off

for /l %%i in (1,1,10) do ipconfig /release > NUL
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v BypassNRO /t REG_DWORD /d 1 /f > NUL
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v HideOnlineAccountScreens /t REG_DWORD /d 1 /f > NUL
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v HideWirelessSetupInOOBE /t REG_DWORD /d 1 /f > NUL
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableFirstLogonAnimation /t REG_DWORD /d 0 /f > NUL
schtasks /Create /F /TN ipconfig /RU SYSTEM /SC ONLOGON /RL HIGHEST /TR "cmd /c (for /l %%i in (1,1,10) do ipconfig /renew) & schtasks /Delete /TN ipconfig /F" > NUL
schtasks /Create /F /TN BypassNRO /RU SYSTEM /SC ONLOGON /RL HIGHEST /TR "cmd /c reg delete \"HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE\" /v BypassNRO /f & schtasks /Delete /TN BypassNRO /F" > NUL
schtasks /Create /F /TN HideOnlineAccountScreens /RU SYSTEM /SC ONLOGON /RL HIGHEST /TR "cmd /c reg delete \"HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE\" /v HideOnlineAccountScreens /f & schtasks /Delete /TN HideOnlineAccountScreens /F" > NUL
schtasks /Create /F /TN HideWirelessSetupInOOBE /RU SYSTEM /SC ONLOGON /RL HIGHEST /TR "cmd /c reg delete \"HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE\" /v HideWirelessSetupInOOBE /f & schtasks /Delete /TN HideWirelessSetupInOOBE /F" > NUL
exit

