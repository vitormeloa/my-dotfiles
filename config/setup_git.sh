#!/bin/bash

setup_git() {
    read -p "Digite seu nome de usuário do Git: " git_user_name
    read -p "Digite seu email do Git: " git_user_email

    echo "Configurando Git..."
    git config --global user.name "$git_user_name"
    git config --global user.email "$git_user_email"
    git config --global color.ui true
    git config --global core.editor "nano"
    check_error "Falha ao configurar o Git."
    success "Git configurado com sucesso."
}

setup_git
