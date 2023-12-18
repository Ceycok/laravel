# Use the official PHP 7.4 image from Docker Hub
FROM php:8.2-fpm

# Install necessary PHP extensions
RUN docker-php-ext-install pdo_mysql

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set the working directory
WORKDIR /var/www

# Remove the default nginx index page
RUN rm -rf /var/www/html

# Copy the application files to the container
COPY . /var/www

# Install the application's dependencies
RUN composer install

# Expose port 9000 and start php-fpm server
CMD ["php-fpm"]