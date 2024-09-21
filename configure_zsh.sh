#!/bin/bash

################################################################################################
# Este script instala pacotes APT e Flatpak necessários para o funcionamento do sistema Ubuntu.
#
# by ruanvalente - version 0.1
#
# Todas as vossas coisas sejam feitas com amor. | I Coríntios 16:14
#
################################################################################################

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
