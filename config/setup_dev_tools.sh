#!/bin/bash

setup_dev_tools() {
    echo "Instalando ferramentas de desenvolvimento..."
    sudo apt install -y \
        python3 \
        python3-pip \
        nodejs \
        npm \
        docker.io \
        docker-compose
    check_error "Falha ao instalar ferramentas de desenvolvimento."
    success "Ferramentas de desenvolvimento instaladas com sucesso."
}

setup_dev_tools
