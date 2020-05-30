FROM php:7.4.4-apache

# PHP
RUN apt update
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install pdo_mysql
RUN apt install -y libzip-dev
RUN docker-php-ext-install zip
RUN mv "${PHP_INI_DIR}/php.ini-production" "${PHP_INI_DIR}/php.ini"

# APACHE
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
