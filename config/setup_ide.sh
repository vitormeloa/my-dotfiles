#!/bin/bash

setup_ide() {
    echo "Installing Visual Studio Code..."

    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    check_error "Failed to add VS Code repository and key."

    sudo apt update && sudo apt install -y code
    check_error "Failed to install Visual Studio Code."
    success "Visual Studio Code installed successfully."

    echo "Installing essential VS Code extensions..."
    code --install-extension ms-python.python
    code --install-extension ms-vscode.cpptools
    code --install-extension ms-azuretools.vscode-docker
    code --install-extension dbaeumer.vscode-eslint
    code --install-extension esbenp.prettier-vscode
    check_error "Failed to install VS Code extensions."
    success "VS Code extensions installed successfully."
}

setup_ide