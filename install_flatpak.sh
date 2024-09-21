#!/bin/bash

################################################################################################
# Este script instala pacotes APT e Flatpak necessários para o funcionamento do sistema Ubuntu.
#
# by ruanvalente - version 0.1
#
# Todas as vossas coisas sejam feitas com amor. | I Coríntios 16:14
#
################################################################################################

FLATPAK_PACKAGES=(
    "com.discordapp.Discord"
    "org.telegram.desktop"
    "md.obsidian.Obsidian"
    "com.github.Matoking.protontricks"
    "ru.linux_gaming.PortProton"
    "net.davidotek.pupgui2"
    "net.lutris.Lutris"
    "com.vysp3r.ProtonPlus"
    "io.dbeaver.DBeaverCommunity"
    "com.jetbrains.IntelliJ-IDEA-Ultimate"
    "com.visualstudio.code-oss"
    "io.beekeeperstudio.Studio"
    "io.podman_desktop.PodmanDesktop"
)

# Função para instalação via Flatpak
install_package_using_flatpak() {
    clear
    echo_message "Iniciando instalação via Flatpak..."
    
    echo_message "Atualizando o sistema"
    sudo apt update && sudo apt upgrade -y

    # Adiciona o repositório Flathub
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    for package in "${FLATPAK_PACKAGES[@]}"; do
        echo_message "Instalando $package..."
        flatpak install -y flathub "$package"
    done
}

# Função para desinstalar pacotes Flatpak instalados
undo_install_package_using_flatpak() {
    clear
    echo_message "Desinstalando pacotes Flatpak instalados..."

    for package in "${FLATPAK_PACKAGES[@]}"; do
        echo_message "Desinstalando $package..."
        flatpak uninstall -y "$package"
    done
}