@echo off
sc config wuauserv start= disabled
sc config WSearch start= disabled
sc config Spooler start= disabled
sc config SysMain start= disabled
sc config fdPHost start= disabled
sc config DPS start= disabled
sc config upnphost start= disabled
sc config SSDPSRV start= disabled
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61
echo largada
