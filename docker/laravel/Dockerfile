FROM php:8.0-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libonig-dev \
    libzip-dev \
    zip \
    unzip \
    curl

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# php.iniファイルのコピー
ARG APP_ENV=local
COPY ./docker/laravel/php.ini.${APP_ENV} $PHP_INI_DIR/php.ini

# Set working directory
WORKDIR /var/www

# Copy existing application directory contents
COPY ./laravel-app /var/www

# Install any needed packages specified in requirements.txt
RUN composer install

# Expose port
EXPOSE 9000

CMD ["php-fpm"]