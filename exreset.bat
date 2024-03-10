@echo off
echo Reiniciando o Explorer.exe...
taskkill /f /im explorer.exe
start explorer.exe
echo Explorer.exe reiniciado com sucesso.
exit