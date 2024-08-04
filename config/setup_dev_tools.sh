#!/bin/bash

setup_dev_tools() {
    echo "Installing development tools..."
    sudo apt install -y \
        python3 \
        python3-pip \
        nodejs \
        npm \
        docker.io \
        docker-compose
    check_error "Failed to install development tools."
    success "Development tools installed successfully."
}

setup_dev_tools