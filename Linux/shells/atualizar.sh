#!/usr/bin/env bash
#
# Atualizar.sh - Usado para atualizar os pacotes apt, flatpak, snap e os pacotes de pip
#
# Autor:         Guilherme Andrade
#
# ------------------------------------------------------------------------ #
#
# COMO USAR?
#   $ chmod +x /diretório/atualizar.sh
#   $ ./atualizar.sh


sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get upgrade
sudo apt-get autoremove

sudo snap refresh


flatpak repair
flatpak update
flatpak update --user
flatpak update --system
flatpak update --appstream


if [ -f /var/run/reboot-required ]; then
  echo 'É nescessário Reiniciar!'
  echo -e $TEXT_RESET
fi

while true; do
  read -p "Pronto para reiniciar? " sn
  case $sn in
  [Ss]* ) reboot; break;;
  [Nn]* ) exit;;
  * ) echo "Digite [S] ou [N]";;
  esac
done
