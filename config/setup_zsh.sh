#!/bin/bash

setup_zsh() {
    if is_installed "zsh"; then
        success "Zsh já está instalado."
    else
        echo "Instalando Zsh..."
        sudo apt install -y zsh
        check_error "Falha ao instalar o Zsh."
        success "Zsh instalado com sucesso."
    fi

    echo "Tornando Zsh o shell padrão..."
    chsh -s $(which zsh)
    check_error "Falha ao tornar o Zsh o shell padrão."
    success "Zsh agora é o shell padrão."

    echo "Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    check_error "Falha ao instalar o Oh My Zsh."
    success "Oh My Zsh instalado com sucesso."

    echo "Instalando Starship..."
    curl -fsSL https://starship.rs/install.sh | bash
    check_error "Falha ao instalar o Starship."
    success "Starship instalado com sucesso."

    echo "Configurando Starship..."
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
    check_error "Falha ao configurar o Starship."
    success "Starship configurado com sucesso."

    echo "Instalando plugins de autocompletar comandos..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    check_error "Falha ao instalar o plugin zsh-autosuggestions."
    success "Plugin zsh-autosuggestions instalado com sucesso."

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    check_error "Falha ao instalar o plugin zsh-syntax-highlighting."
    success "Plugin zsh-syntax-highlighting instalado com sucesso."

    if [ -f ~/.zshrc ]; then
        cp ~/.zshrc ~/.zshrc.backup
        success "Backup do .zshrc criado como .zshrc.backup."
    fi

    echo "Configurando .zshrc..."
    sed -i 's/^plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
    check_error "Falha ao configurar plugins no .zshrc."
    success "Plugins configurados no .zshrc com sucesso."

    echo "source ${(q-)PWD}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
    echo "source ${(q-)PWD}/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
    check_error "Falha ao adicionar plugins ao .zshrc."
    success "Plugins adicionados ao .zshrc com sucesso."

    echo -e "${GREEN}Instalação e configuração do Zsh concluídas! Abra um novo terminal para ver as mudanças.${NC}"
}

setup_zsh
