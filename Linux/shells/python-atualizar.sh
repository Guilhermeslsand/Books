#!/usr/bin/env bash
#
# python-atualizar.sh - atualizar um ambiente virtual de python
#
# Autor:         Guilherme Andrade
#
# ------------------------------------------------------------------------ #
#
# COMO USAR?
#   $ chmod +x /diretório/python-atualizar.sh
#   $ ./python-atualizar.sh
#
# ----------------------------- VARIÁVEIS ----------------------------- #



# Verifica se foi fornecido o nome do ambiente virtual como argumento
if [ -z "$1" ]; then
    echo "Uso: $0 <nome_do_ambiente_virtual>"
    exit 1
fi

# Ativa o ambiente virtual
echo "Ativando ambiente virtual $1"
source "Ambientespyp/$1/bin/activate"

#Atualizando extensões
echo "Atualizando labextensions..."
jupyter labextension  update --all

# Atualiza o pip
echo "Atualizando pip..."
pip install --upgrade pip

# Atualiza os pacotes
echo "Atualizando pacotes..."
pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

# Desativa o ambiente virtual
echo "Desativando ambiente virtual..."
deactivate

echo "Processo de atualização concluído."

