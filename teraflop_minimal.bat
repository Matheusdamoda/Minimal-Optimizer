@echo off
 title Minimal Optimizer - Grupo aMathyzin
echo.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v featureSettings /t REG_DWORD /d 1 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 3 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeaturesSettingsOverrideMask /t REG_DWORD /d 3 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Dwm" /v OverlayTestMode /t REG_DWORD /d 5 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\MouseKeys" /v flags /t REG_DWORD /d 0 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v flags /t REG_DWORD /d 0 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "DisableTaggedEnergyLogging" /t REG_DWORD /d "1" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxApplication" /t REG_DWORD /d "0" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxTagPerApplication" /t REG_DWORD /d "0" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "16" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "10" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "18" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.

schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /disable >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /disable >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /end /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /end /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /end /tn "\Microsoft\Windows\Application Experience\StartupAppTask" >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /disable >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" >nul && echo Minimal Optimizer - Otimizado com sucesso.
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /disable >nul && echo Minimal Optimizer - Otimizado com sucesso.

reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t REG_DWORD /d 00000005 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enabled" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v "Enabled" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "Enabled" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "Enabled" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "Enabled" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.

reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.

reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 00000001 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 00000001 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 00000002 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.

reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "VRROptimizeEnable=0;" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.

reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d "0" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "0" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "0" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "0" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.

reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 00000001 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.

reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.

reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 00000001 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 00000001 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.

reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d 00000001 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey" /v "EnableEventTranscript" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_BINARY /d "-" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
-----------------------

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Deny" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.

reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 00000001 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d 00000000 /f >nul && echo Minimal Optimizer - Otimizado com sucesso.

reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TapiSrv" /v "Start" /t REG_DWORD /d "3" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\FontCache3.0.0.0" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WpcMonSvc" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SEMgrSvc" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\PNRPsvc" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\LanmanWorkstation" /v "Start" /t REG_DWORD /d "3" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WEPHOSTSVC" /v "Start" /t REG_DWORD /d "3" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\p2psvc" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\p2pimsvc" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\PhoneSvc" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wuauserv" /v "Start" /t REG_DWORD /d "3" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Wecsvc" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SensorDataService" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SensrSvc" /v "Start" /t REG_DWORD /d "3" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\perceptionsimulation" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\StiSvc" /v "Start" /t REG_DWORD /d "3" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\OneSyncSvc" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ConsentUxUserSvc" /v Start /t REG_DWORD /d "3" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicePickerUserSvc" /v Start /t REG_DWORD /d "3" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UnistoreSvc" /v Start /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicesFlowUserSvc" /v Start /t REG_DWORD /d "3" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WMPNetworkSvc" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\icssvc" /v "Start" /t REG_DWORD /d "3" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DusmSvc" /v "Start" /t REG_DWORD /d "3" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\MapsBroker" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\edgeupdate" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SensorService" /v "Start" /t REG_DWORD /d "3" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\shpamsvc" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\svsvc" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SysMain" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\MSiSCSI" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Netlogon" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\CscService" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\ssh-agent" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\AppReadiness" /v "Start" /t REG_DWORD /d "3" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\tzautoupdate" /v "Start" /t REG_DWORD /d "3" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\NfsClnt" /v "Start" /t REG_DWORD /d "3" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wisvc" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\defragsvc" /v "Start" /t REG_DWORD /d "4" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.

bcdedit /set disabledynamictick yes >nul && echo Minimal Optimizer - Otimizado com sucesso.
bcdedit /deletevalue useplatformclock >nul && echo Minimal Optimizer - Otimizado com sucesso.
bcdedit /set useplatformtick yes >nul && echo Minimal Optimizer - Otimizado com sucesso.

del /q /s C:\Windows\*.log >nul && echo Minimal Optimizer - Otimizado com sucesso.
for /f "tokens=*" %%G in ('wevtutil.exe el') DO (wevtutil.exe cl "%%G") >nul && echo Minimal Optimizer - Otimizado com sucesso.

del /q /s C:\Windows\Temp\*.* >nul && echo Minimal Optimizer - Otimizado com sucesso.

rd /s /q C:\$Recycle.bin >nul && echo Minimal Optimizer - Otimizado com sucesso.

taskkill -F -FI "IMAGENAME eq SystemSettings.exe" >nul && echo Minimal Optimizer - Otimizado com sucesso.
net stop wuauserv >nul && echo Minimal Optimizer - Otimizado com sucesso.
net stop UsoSvc >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t REG_DWORD /d "1" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "SetDisableUXWUAccess" /t REG_DWORD /d "1" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f >nul && echo Minimal Optimizer - Otimizado com sucesso.
gpupdate /force >nul && echo Minimal Optimizer - Otimizado com sucesso.
rd /s /q "C:\Windows\SoftwareDistribution" >nul && echo Minimal Optimizer - Otimizado com sucesso.
md "C:\Windows\SoftwareDistribution" >nul && echo Minimal Optimizer - Otimizado com sucesso.
net start wuauserv >nul && echo Minimal Optimizer - Otimizado com sucesso.
net start UsoSvc >nul && echo Minimal Optimizer - Otimizado com sucesso.
exit
