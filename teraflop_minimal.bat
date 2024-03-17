@echo off
:: Criar arquivo temporário para indicar início da otimização
echo. > C:\Windows\Cursors\otimizando.tmp

:: Adicione seus comandos de otimização aqui
echo Iniciando otimização...
timeout /t 5

:: Simulação de comandos de otimização
echo Otimização em andamento...
timeout /t 5

:: Deletar o arquivo temporário para indicar o fim da otimização
del C:\Windows\Cursors\otimizando.tmp

echo Otimização concluída.
