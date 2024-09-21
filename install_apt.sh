#!/bin/bash

################################################################################################
# Este script instala pacotes APT e Flatpak necessários para o funcionamento do sistema Ubuntu.
#
# by ruanvalente - version 0.1
#
# Todas as vossas coisas sejam feitas com amor. | I Coríntios 16:14
#
################################################################################################

APT_PACKAGES=(
    curl
    ubuntu-restricted-extras
    build-essential
    git
    vlc
    audacious
    deluge
    zsh
    htop
    dfc
    flatpak
    gnome-software-plugin-flatpak
    fonts-firacode
    gnome-boxes
    podman
    podman-compose
    podman-docker
)

# Função para instalação via APT
install_package_using_apt() {
    clear
    echo_message "Iniciando instalação via APT..."
    
    echo_message "Atualizando o sistema"
    sudo apt update && sudo apt upgrade -y

    sudo apt install -y "${APT_PACKAGES[@]}"
}

# Função para desinstalar pacotes APT instalados
undo_install_package_using_apt() {
    clear
    echo_message "Desinstalando pacotes instalados via APT..."

    sudo apt remove --purge -y "${APT_PACKAGES[@]}"
    sudo apt autoremove -y
}