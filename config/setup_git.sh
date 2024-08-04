#!/bin/bash

setup_git() {
    read -p "Enter your Git username: " git_user_name
    read -p "Enter your Git email: " git_user_email

    echo "Configuring Git..."
    git config --global user.name "$git_user_name"
    git config --global user.email "$git_user_email"
    git config --global color.ui true
    git config --global core.editor "nano"
    check_error "Failed to configure Git."
    success "Git configured successfully."
}

setup_git