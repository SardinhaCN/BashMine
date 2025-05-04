clear
pkg install wget -y
pkg install proot -y
pkg install cmake -y
git clone https://github.com/xmrig/xmrig.git
mkdir xmrig/build && cd xmrig/build #!/bin/bash

COMANDOS_DIR="./install"

# Verifica se o diretório existe
if [ ! -d "$COMANDOS_DIR" ]; then
    echo "A pasta '$COMANDOS_DIR' não existe."
    exit 1
fi

# Banner com figlet
clear
echo "====================================="
figlet "BASH - MINER"
echo "====================================="

# Menu interativo
echo "===== MENU de Instalação ====="
comandos=()
i=1

# Lista scripts .sh na pasta
for file in "$COMANDOS_DIR"/*.sh; do
    nome=$(basename "$file" .sh)
    echo "$i) $nome"
    comandos+=("$file")
    ((i++))
done

echo "0) Sair"
echo "============================"

# Leitura da escolha
read -p "Escolha uma opção: " opcao

# Verifica e executa a opção
if [[ "$opcao" -ge 1 && "$opcao" -lt $i ]]; then
    escolhido="${comandos[$((opcao-1))]}"
    echo "Executando: $(basename "$escolhido")"
    bash "$escolhido"
elif [[ "$opcao" == 0 ]]; then
    echo "Saindo..."
else
    echo "Opção inválida."
    exit 1
fi
cmake .. -DWITH_HWLOC=OFF && make
cd ..
cd ..
echo "Iniciando Miner"
bash start.sh
