#!/usr/bin/env bash
#
# configurar-jupyter.sh - Instalar e configura programas jupyterlab via pip
#
# Autor:         Guilherme Andrade
#
# ------------------------------------------------------------------------ #
#
# COMO USAR?
#   $ chmod +x /diretório/configurar-jupyter
#   $ ./configurar-jupyter.sh
#

#Baixando node.js
curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install nodejs -y
node -v

# Verifica se foi fornecido o nome do ambiente virtual como argumento
if [ -z "$1" ]; then
    echo "Uso: $0 <nome_do_ambiente_virtual>"
    exit 1
fi

#Criando o Ambiente Virtual
echo "Criando Ambiente $1"
python3 "-m venv /home/guilherme/Ambientespyp/$1"

#Ativando ambiente virtual
echo "Ativando ambiente virtual $1"
source "Ambientespyp/$1/bin/activate"

#Baixando os pacotes
echo "Baixar os pacotes listados"
pip install jupyterlab
pip install matplotlib
playwright install chromium
pip install pandas
pip install nbconvert
pip install nbconvert[webpdf]
jupyter labextension install @jupyterlab/debugger
pip install lckr_jupyterlab_variableinspector
pip install octave-kernel
#pip install pyspice
sudo gem install iruby
iruby register --force
R
install.packages('IRkernel')
IRkernel::installspec()

echo "Desativando ambiente virtual..."
deactivate

echo "Processo de criação do jupyter finalizado concluído."
