# Stage 1: Build stage (jika ada dependensi composer, dll - untuk sekarang hanya copy)
FROM php:8.2-cli AS build

WORKDIR /app
COPY public/ public/

# Stage 2: Final image dengan Apache
FROM php:8.2-apache

# Enable mod_rewrite jika perlu
RUN a2enmod rewrite

# Copy kode dari build ke Apache document root
COPY --from=build /app/public /var/www/html

EXPOSE 80