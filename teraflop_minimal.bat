@echo off
REM Criar arquivo temporário para indicar que a otimização está em andamento
echo. > C:\windows\cursors\otimizando.tmp
timeout /t 3

REM Aqui vai o código de otimização existente

REM Deletar o arquivo temporário para indicar que a otimização terminou
del C:\windows\cursors\otimizando.tmp
