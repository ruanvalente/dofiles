#!/bin/bash

# Função para exibir mensagens
function echo_message() {
    echo "--------------------------------"
    echo "$1"
    echo "--------------------------------"
    sleep 2
}

# Função para instalação via APT
install_package_using_apt() {
    echo_message "Iniciando instalação via APT..."
    
    echo_message "Atualizando o sistema"
    sudo apt update

    # Lista de pacotes APT
    local apt_packages=(
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

    sudo apt install -y "${apt_packages[@]}"
}

# Função para instalação via Flatpak
install_package_using_flatpack() {
    echo_message "Iniciando instalação via Flatpak..."
    
    echo_message "Atualizando o sistema"
    sudo apt update

    # Adiciona o repositório Flathub
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    # Lista de pacotes Flatpak
    local flatpak_packages=(
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

    for package in "${flatpak_packages[@]}"; do
        echo_message "Instalando $package..."
        flatpak install -y flathub "$package"
    done
}

# Função para configurar o Zsh
configure_zsh() {
    echo_message "Configurando o Zsh..."

    # Instala o Oh My Zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Adiciona plugins ao .zshrc
    local zshrc_file="$HOME/.zshrc"
    
    # Verifica se o arquivo .zshrc já contém a linha de plugins
    if grep -q '^plugins=(' "$zshrc_file"; then
        # Substitui a linha existente
        sed -i.bak 's/^plugins=(.*)/plugins=(git asdf zsh-syntax-highlighting zsh-autosuggestions)/' "$zshrc_file"
    else
        # Adiciona a linha de plugins se não existir
        echo "plugins=(git asdf zsh-syntax-highlighting zsh-autosuggestions)" >> "$zshrc_file"
    fi

    # Instala os plugins
    git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch v0.11.3
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

    echo_message "Zsh configurado com sucesso!"
}

# Menu principal
while true; do
    echo "Olá, ${USER}. Escolha uma opção:"
    echo "1) Instalar pacotes via APT"
    echo "2) Instalar pacotes via Flatpak"
    echo "3) Configurar Zsh"
    echo "4) Sair"
    read -p "Opção: " options

    case $options in
        1)
            install_package_using_apt
            ;;
        2)
            install_package_using_flatpack
            ;;
        3)
            configure_zsh
            ;;
        4)
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac
done
