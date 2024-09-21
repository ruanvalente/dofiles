# Script de instalação de pacotes e configuração de ambiente Ubuntu.

Este script automatiza a instalação de diversos pacotes e a configuração do shell Zsh no Ubuntu (ou qualquer sistema baseado em Debian). Ele oferece uma interface simples em que você pode escolher entre instalar pacotes via APT, Flatpak, configurar o Zsh, desfazer todas as ações, ou sair.

## Como o script funciona

### Funcionalidades:
- Instalar pacotes via APT: Instala uma lista de pacotes essenciais para desenvolvimento e uso diário.
- Instalar pacotes via Flatpak: Instala uma lista de pacotes adicionais usando o Flathub.
- Configurar Zsh: Configura o Zsh como shell padrão, instala o Oh My Zsh e adiciona plugins úteis.
- Desfazer todas as ações: Remove todos os pacotes instalados via APT e Flatpak, além de reverter a configuração do Zsh.
- Sair: Encerra o script.

## Como Executar o Script

### Passo a Passo:
- 1 - Clone o repositório ou faça o download do script:
```bash
git clone https://github.com/ruanvalente/dofiles

cd dofiles
```

- 2 - Torne o script executável:
```bash
chmod +x initialize.sh
```

- 3 - Execute o script:
```bash
./initialize.sh
```

- 4 - Siga as instruções no menu interativo para escolher uma das opções (Instalar pacotes via APT, Flatpak, configurar Zsh, etc.).

## Requisitos:

- Um sistema baseado em Ubuntu ou Debian.
- O gerenciador de pacotes apt.
- O gerenciador flatpak instalado (caso ainda não tenha instalado, o script cuidará disso).
- Conexão à Internet para baixar os pacotes.


## Pacotes instalados

### Pacotes instalados via APT (Sistema):

Os pacotes listados abaixo são instalados usando o gerenciador de pacotes apt. Eles são ferramentas essenciais para o sistema e desenvolvimento:

- curl: Ferramenta de linha de comando para transferir dados com URLs.
- ubuntu-restricted-extras: Pacotes extras recomendados para Ubuntu, como codecs multimídia.
- build-essential: Conjunto de ferramentas necessárias para compilar software no Ubuntu.
- git: Sistema de controle de versão distribuído.
- vlc: Reprodutor multimídia versátil.
- audacious: Player de música leve e com suporte a diversos formatos.
- deluge: Cliente BitTorrent.
- zsh: Shell Zsh, que será configurado como o shell padrão.
- htop: Visualizador de processos interativo.
- dfc: Ferramenta para exibir o uso de espaço em disco com informações detalhadas.
- flatpak: Gerenciador de pacotes para aplicativos contêineres.
- gnome-software-plugin-flatpak: Plugin para gerenciar Flatpaks através da interface gráfica do Gnome.
- fonts-firacode: Fonte Fira Code com suporte a ligaduras, ideal para programadores.
- gnome-boxes: Ferramenta para gerenciar máquinas virtuais.
- podman: Ferramenta para gerenciar contêineres OCI.
- podman-compose: Gerenciador de composições de contêineres usando Podman (similar ao Docker Compose).
- podman-docker: Interface de compatibilidade do Docker para Podman.

### Pacotes Instalados via Flatpak:

Esses pacotes são instalados usando o Flathub, uma loja de aplicativos que distribui pacotes Flatpak:

- Discord (com.discordapp.Discord): Aplicativo de comunicação por voz, vídeo e texto.
- Telegram (org.telegram.desktop): Mensageiro instantâneo multiplataforma.
- Obsidian (md.obsidian.Obsidian): Aplicativo para tomada de notas e gerenciamento de conhecimento pessoal.
- Protontricks (com.github.Matoking.protontricks): Ferramenta para gerenciar jogos do Steam via Proton.
- PortProton (ru.linux_gaming.PortProton): Ferramenta para otimizar jogos de Proton no Linux.
- PupGUI2 (net.davidotek.pupgui2): Interface gráfica para o ProtonUp-Qt.
- Lutris (net.lutris.Lutris): Plataforma de jogos para Linux que ajuda a gerenciar jogos e emuladores.
- ProtonPlus (com.vysp3r.ProtonPlus): Aplicativo para melhorar a experiência com Proton e jogos do Steam.
- DBeaver Community (io.dbeaver.DBeaverCommunity): Ferramenta universal para administração de banco de dados.
- IntelliJ IDEA Ultimate (com.jetbrains.IntelliJ-IDEA-Ultimate): IDE para desenvolvimento de software (necessário uma licença).
- Visual Studio Code (com.visualstudio.code-oss): Editor de código-fonte leve e poderoso.
- Beekeeper Studio (io.beekeeperstudio.Studio): Editor gráfico de banco de dados SQL.
- Podman Desktop (io.podman_desktop.PodmanDesktop): Interface gráfica para gerenciar contêineres do Podman.

## Desfazendo as Ações
Se desejar remover os pacotes instalados e reverter as configurações do Zsh, escolha a opção 4) Desfazer todas as ações no menu. Isso:

- Desinstalará todos os pacotes instalados via APT e Flatpak.
- Reverterá o shell para Bash e removerá a configuração do Zsh.

## Considerações Finais

Ao final do script, será exibida uma mensagem solicitando que você reinicie o sistema para garantir que todas as alterações sejam aplicadas corretamente.

> Todas as vossas coisas sejam feitas com amor. | I Coríntios 16:14

<p align="center">
Made with ❤️ by Ruan Valente 👋🏽
</p>
