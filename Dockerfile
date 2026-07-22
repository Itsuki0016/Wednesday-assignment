FROM php:8.4-fpm-alpine AS php

RUN apk add --no-cache curl-dev libpng-dev $PHPIZE_DEPS

RUN docker-php-ext-install curl exif gd pdo_mysql

RUN pecl install apcu \
    && docker-php-ext-enable apcu
