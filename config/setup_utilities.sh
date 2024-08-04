#!/bin/bash

setup_utilities() {
    echo "Installing additional utilities..."
    sudo apt install -y \
        htop \
        tmux \
        vim \
        tree
    check_error "Failed to install additional utilities."
    success "Additional utilities installed successfully."
}

setup_utilities