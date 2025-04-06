# Tahap build (bisa ditambah composer dsb kalau pakai dependency manager nanti)
FROM php:8.2-cli AS build

WORKDIR /app
COPY public/ /app/

# Tahap production
FROM php:8.2-apache

# Aktifkan modul rewrite agar .htaccess bisa bekerja
RUN a2enmod rewrite

# Salin hasil build ke direktori web Apache
COPY --from=build /app /var/www/html

# Aktifkan penggunaan .htaccess
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

EXPOSE 80