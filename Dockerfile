FROM php:8.1.8-fpm
ENV APP_HOME /var/www/html
COPY --from=composer_build /app/ /var/www/html/
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data \
    && chown -R www-data:www-data /var/www/html \
    && apt-get update && apt-get install -y nginx \
    && rm /etc/nginx/sites-enabled/default \
    && echo "server { listen 80; server_name localhost; root /var/www/html/public; index index.php index.html index.htm; location / { try_files \$uri \$uri/ /index.php?\$query_string; } location ~ \\.php\$ { include snippets/fastcgi-php.conf; fastcgi_pass unix:/var/run/php/php8.1-fpm.sock; } }" > /etc/nginx/sites-available/default \
    && ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
ENTRYPOINT []
CMD nginx -g "daemon off;"
