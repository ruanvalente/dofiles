#!/bin/bash

################################################################################################
# Este script instala pacotes APT e Flatpak necessários para o funcionamento do sistema Ubuntu.
#
# by ruanvalente - version 0.1
#
# Todas as vossas coisas sejam feitas com amor. | I Coríntios 16:14
#
################################################################################################

END_SCRIPT_MESSAGE="Obrigado por usar o script.\nPara que as configurações sejam refletidas, é necessário reiniciar o seu sistema."

# Listas de pacotes APT e Flatpak
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

# Função para exibir mensagens
function echo_message() {
    echo "--------------------------------"
    echo "$1"
    echo "--------------------------------"
    sleep 2
}

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

# Função para configurar o Zsh
configure_zsh() {
    clear
    echo_message "Configurando o Zsh..."

    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    local zshrc_file="$HOME/.zshrc"
    
    if grep -q '^plugins=(' "$zshrc_file"; then
        sed -i.bak 's/^plugins=(.*)/plugins=(git asdf zsh-syntax-highlighting zsh-autosuggestions)/' "$zshrc_file"
    else
        echo "plugins=(git asdf zsh-syntax-highlighting zsh-autosuggestions)" >> "$zshrc_file"
    fi

    # Instala os plugins
    git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch v0.11.3
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

    echo_message "Zsh configurado com sucesso!"

    chsh -s $(which zsh)
}

# Função para desfazer a configuração do Zsh
undo_configure_zsh() {
    clear
    echo_message "Desfazendo a configuração do Zsh..."
    sleep 3

    rm -rf "$HOME/.oh-my-zsh"    
    rm -rf "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
    rm -rf "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
    rm -rf "$HOME/.asdf"

    chsh -s $(which bash)

    echo_message "Configuração do Zsh desfeita e shell revertido para Bash."
}

# Função para desfazer todas as ações
undo_all() {
    clear
    echo_message "Desfazendo todas as ações..."
    undo_install_package_using_apt
    undo_install_package_using_flatpak
    undo_configure_zsh
    echo_message "Todas as ações foram desfeitas."
}

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
