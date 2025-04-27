#!/bin/bash

PASTA="/xmrig/build"
COMANDOS_DIR="./comandos"
COMANDO_ALTERNATIVA="curl -fsSL https://bit.ly/install-Mine | bash"

mostrar_menu() {
    echo ""
    echo "Escolha uma opção:"

    i=1
    comandos=()
    for file in "$COMANDOS_DIR"/*.sh; do
        echo "$i) $(basename "$file" .sh)"
        comandos+=("$file")
        ((i++))
    done
    echo "0) Sair"
    echo ""

    read -p "Digite o número da opção: " opcao

    if [[ "$opcao" -ge 1 && "$opcao" -lt $i ]]; then
        escolhido="${comandos[$((opcao-1))]}"
        echo "Executando $(basename "$escolhido")..."
        bash "$escolhido"
    elif [[ "$opcao" == 0 ]]; then
        echo "Saindo..."
        exit 0
    else
        echo "Opção inválida!"
        exit 1
    fi
}

# Verifica se a pasta existe
if [ -d "$PASTA" ]; then
    echo "Pasta encontrada: $PASTA"
else
    echo "Pasta NÃO encontrada."
    echo "Executando ação alternativa..."
    COMANDO_ALTERNATIVA
fi

# Mostra o menu apenas uma vez
mostrar_menu
