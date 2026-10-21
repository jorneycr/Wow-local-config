FROM node:22-alpine AS frontend-build

WORKDIR /app
COPY package.json ./
RUN npm install
COPY index.html vite.config.js ./
COPY src ./src
RUN npm run build

FROM php:8.2-fpm-alpine

RUN apk add --no-cache nginx gmp-dev \
    && docker-php-ext-install mysqli gmp

COPY --from=frontend-build /app/dist /var/www/frontend
COPY composer.json /var/www/composer.json
COPY api.php auth.php db.php http.php rate-limit.php security.php srp6.php validation.php /var/www/
COPY nginx.conf /etc/nginx/http.d/default.conf

RUN apk add --no-cache composer \
    && cd /var/www \
    && composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader

RUN { \
      echo 'display_errors=Off'; \
      echo 'log_errors=On'; \
    } > /usr/local/etc/php/conf.d/security.ini

RUN chown -R www-data:www-data /var/www/frontend /var/www/vendor

RUN mkdir -p /run/nginx

CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
