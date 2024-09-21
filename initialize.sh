#!/bin/bash

################################################################################################
# Este script instala pacotes APT e Flatpak necessários para o funcionamento do sistema Ubuntu.
#
# by ruanvalente - version 0.1
#
# Todas as vossas coisas sejam feitas com amor. | I Coríntios 16:14
#
################################################################################################

source ./utils.sh
source ./install_apt.sh
source ./install_flatpak.sh
source ./configure_zsh.sh

END_SCRIPT_MESSAGE="Obrigado por usar o script.\nPara que as configurações sejam refletidas, é necessário reiniciar o seu sistema."

# Menu principal
while true; do
    clear
    echo "Olá, ${USER}. Escolha uma opção:"
    echo "1) Instalar pacotes via APT"
    echo "2) Instalar pacotes via Flatpak"
    echo "3) Configurar Zsh"
    echo "4) Desfazer todas as ações"
    echo "5) Sair"
    read -p "Opção: " options

    case $options in
        1)
            install_package_using_apt
            ;;
        2)
            install_package_using_flatpak
            ;;
        3)
            configure_zsh
            ;;
        4)
            clear
            echo -e "$END_SCRIPT_MESSAGE"
            sleep 3
            undo_all
            ;;
        5)
            echo -e "$END_SCRIPT_MESSAGE"
            sleep 3
            echo "Saindo..."
            exec zsh
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            sleep 2
            ;;
    esac
done