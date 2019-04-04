FROM php:7.1-apache
Maintainer Matthew Setter <matthew@matthewsetter.com>

RUN apt-get update && \
    apt-get install -y \
    zlib1g-dev libicu-dev g++ libpng-dev libzip-dev

RUN docker-php-ext-configure intl 
RUN docker-php-ext-install intl gd zip pdo pdo_mysql
RUN a2enmod ssl

