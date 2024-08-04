#!/bin/bash

setup_utilities() {
    echo "Instalando utilitários adicionais..."
    sudo apt install -y \
        htop \
        tmux \
        vim \
        tree
    check_error "Falha ao instalar utilitários adicionais."
    success "Utilitários adicionais instalados com sucesso."
}

setup_utilities
