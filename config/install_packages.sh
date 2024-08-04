#!/bin/bash

install_packages() {
    echo "Installing basic packages..."
    sudo apt update && sudo apt install -y \
        curl \
        wget \
        git \
        build-essential \
        software-properties-common \
        apt-transport-https \
        ca-certificates \
        gnupg-agent
    check_error "Failed to install basic packages."
    success "Basic packages installed successfully."
}

install_packages
