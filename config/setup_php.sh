#!/bin/bash

setup_php() {
    echo "Instalando PHP e Composer..."

    # php
    sudo add-apt-repository -y ppa:ondrej/php
    check_error "Falha ao adicionar repositório do PHP."

    sudo apt update && sudo apt install -y \
        php \
        php-cli \
        php-fpm \
        php-json \
        php-common \
        php-mysql \
        php-zip \
        php-gd \
        php-mbstring \
        php-curl \
        php-xml \
        php-bcmath \
        php-json
    check_error "Falha ao instalar PHP e extensões."
    success "PHP e extensões instalados com sucesso."

    # composer
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
    check_error "Falha ao instalar o Composer."
    success "Composer instalado com sucesso."
}

setup_php
