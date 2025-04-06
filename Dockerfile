# Tahap 1: Base image untuk PHP
FROM php:8.2-cli AS build

WORKDIR /app
COPY index.php .

# Tahap 2: Final image
FROM php:8.2-apache

COPY --from=build /app /var/www/html

EXPOSE 80