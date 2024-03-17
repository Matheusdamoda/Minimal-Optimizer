@echo off
echo  iniciando
timeout /t 5
REM Cria um arquivo temporário para indicar que a otimização está em andamento
echo > C:\Windows\Cursors\otimizacao_temp.txt

REM Insira aqui os comandos de otimização que você deseja executar

REM Deleta o arquivo temporário ao concluir a otimização, indicando seu término
del C:\Windows\Cursors\otimizacao_temp.txt
echo finalizado.
