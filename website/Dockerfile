FROM php:8.2-fpm-alpine

RUN docker-php-ext-install mysqli \
    && apk add --no-cache nginx

COPY index.php /var/www/html/index.php
COPY db.php /var/www/html/db.php
COPY nginx.conf /etc/nginx/http.d/default.conf

RUN mkdir -p /run/nginx

CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
