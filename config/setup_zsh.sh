#!/bin/bash

setup_zsh() {
    if is_installed "zsh"; then
        success "Zsh is already installed."
    else
        echo "Installing Zsh..."
        sudo apt install -y zsh
        check_error "Failed to install Zsh."
        success "Zsh installed successfully."
    fi

    echo "Making Zsh the default shell..."
    chsh -s $(which zsh)
    check_error "Failed to make Zsh the default shell."
    success "Zsh is now the default shell."

    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    check_error "Failed to install Oh My Zsh."
    success "Oh My Zsh installed successfully."

    echo "Installing Starship..."
    curl -fsSL https://starship.rs/install.sh | bash
    check_error "Failed to install Starship."
    success "Starship installed successfully."

    echo "Configuring Starship..."
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
    check_error "Failed to configure Starship."
    success "Starship configured successfully."

    echo "Installing command auto-completion plugins..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    check_error "Failed to install zsh-autosuggestions plugin."
    success "zsh-autosuggestions plugin installed successfully."

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    check_error "Failed to install zsh-syntax-highlighting plugin."
    success "zsh-syntax-highlighting plugin installed successfully."

    if [ -f ~/.zshrc ]; then
        cp ~/.zshrc ~/.zshrc.backup
        success "Backup of .zshrc created as .zshrc.backup."
    fi

    echo "Configuring .zshrc..."
    sed -i 's/^plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
    check_error "Failed to configure plugins in .zshrc."
    success "Plugins configured in .zshrc successfully."

    echo "source ${(q-)PWD}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
    echo "source ${(q-)PWD}/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
    check_error "Failed to add plugins to .zshrc."
    success "Plugins added to .zshrc successfully."

    echo -e "${GREEN}Zsh installation and configuration complete! Open a new terminal to see the changes.${NC}"
}

setup_zsh