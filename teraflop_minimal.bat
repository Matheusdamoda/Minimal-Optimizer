@echo off
timeout /t 10 
for /L %%i in (1,1,50) do (
    echo teste%%i
)
