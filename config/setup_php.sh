#!/bin/bash

setup_php() {
    read -p "Enter PHP version to install (e.g., 7.4, 8.0, 8.1): " php_version

    echo "Installing PHP $php_version and Composer..."

    # php config
    sudo add-apt-repository -y ppa:ondrej/php
    check_error "Failed to add PHP repository."

    sudo apt update && sudo apt install -y \
        php$php_version \
        php$php_version-cli \
        php$php_version-fpm \
        php$php_version-json \
        php$php_version-common \
        php$php_version-mysql \
        php$php_version-zip \
        php$php_version-gd \
        php$php_version-mbstring \
        php$php_version-curl \
        php$php_version-xml \
        php$php_version-bcmath
    check_error "Failed to install PHP $php_version and extensions."
    success "PHP $php_version and extensions installed successfully."

    # composer
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
    check_error "Failed to install Composer."
    success "Composer installed successfully."
}

setup_php