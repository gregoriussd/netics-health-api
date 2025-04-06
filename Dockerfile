# build
FROM php:8.2-cli AS build

WORKDIR /app
COPY public/ /app/

# production
FROM php:8.2-apache

RUN a2enmod rewrite

COPY --from=build /app /var/www/html

RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

EXPOSE 80