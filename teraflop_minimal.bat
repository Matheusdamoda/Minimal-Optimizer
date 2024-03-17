@echo off
echo Limpando a pasta Temp...
del /S /Q "%temp%\*.*"
echo Limpeza da pasta Temp concluída!

echo Limpando arquivos de log do sistema...
for /D %%p in ("%SystemRoot%\System32\LogFiles\*.*") do del "%%p\*.*" /S /Q
echo Limpeza de arquivos de log do sistema concluída!

pause
