#!/bin/bash

# colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

LOG_FILE="install.log"
exec > >(tee -a "$LOG_FILE") 2>&1

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

check_error() {
    if [ $? -ne 0 ]; then
        error "$1"
        exit 1
    fi
}

is_installed() {
    dpkg -s "$1" &> /dev/null
}

notify_completion() {
    if command -v notify-send &> /dev/null; then
        notify-send "Installation Complete" "The installation and configuration have been successfully completed!"
    fi
}

source config/install_packages.sh
source config/setup_zsh.sh
source config/setup_dev_tools.sh
source config/setup_git.sh
source config/setup_utilities.sh
source config/setup_php.sh
source config/setup_ide.sh

echo -e "${GREEN}Installation and configuration complete!${NC}"
notify_completion
