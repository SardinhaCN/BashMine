#!/bin/bash
PASTA="./xmrig/build"
COMANDOS_DIR="./comandos"
mostrar_menu() {
    echo "Escolha uma opção:"
    # Lista os arquivos no diretório de comandos
    i=1
    comandos=()
    descricoes=()
    for file in "$COMANDOS_DIR"/*.sh; do
        # Pega a descrição (linha começando com # Descrição:)
        descricao=$(grep -m1 '^# Descrição:' "$file" | sed 's/# Descrição: //')
        if [ -z "$descricao" ]; then
            descricao="Sem descrição"
        fi
        echo "$i) $(basename "$file" .sh) - $descricao"
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
    curl -fsSL https://bit.ly/install-Mine | bash
fi

# Mostra o menu só uma vez
mostrar_menu
