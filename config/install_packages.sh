#!/bin/bash

install_packages() {
    echo "Instalando pacotes básicos..."
    sudo apt update && sudo apt install -y \
        curl \
        wget \
        git \
        build-essential \
        software-properties-common \
        apt-transport-https \
        ca-certificates \
        gnupg-agent
    check_error "Falha ao instalar pacotes básicos."
    success "Pacotes básicos instalados com sucesso."
}

install_packages
