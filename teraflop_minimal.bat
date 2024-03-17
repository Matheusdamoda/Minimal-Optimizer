@echo off
echo Limpando arquivos temporários...
rem Limpando a pasta de arquivos temporários do usuário atual
del /q /s %temp%\*.*

rem Limpando a pasta de arquivos temporários do sistema
del /q /s C:\Windows\Temp\*.*

echo Limpando arquivos de log...
rem Limpando arquivos de log do sistema
del /q /s C:\Windows\Logs\*.*

echo Limpeza concluída.
pause
