FROM alpine:3.21

RUN ["apk", "add", "--no-cache","php82", "php82-fpm","php-mysqli","php82-json","php82-openssl","php82-curl","php82-xml","php82-mbstring","php82-session","php82-zip","php82-gd"]

RUN ["apk", "add","--no-cache","curl","bash"]


RUN if ! getent group www-data > /dev/null 2>&1; then \
    addgroup -g 82 www-data; \
    fi && \
    if ! getent passwd www-data > /dev/null 2>&1; then \
    adduser -u 82 -D -S -G www-data www-data; \
    fi

RUN mkdir -p /var/www/html /run/php

WORKDIR /var/www/html

RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz
COPY wp-config.php /var/www/html/wp-config.php
COPY www.conf /etc/php82/php-fpm.d/www.conf

RUN chown -R www-data:www-data /var/www/html /run/php && \
    chmod -R 755 /var/www/html && \
    find /var/www/html -type d -exec chmod 755 {} \; && \
    find /var/www/html -type f -exec chmod 644 {} \; && \
    chmod 644 /etc/php82/php-fpm.d/www.conf && \
    chown root:root /etc/php82/php-fpm.d/www.conf

USER www-data

EXPOSE 9000

CMD ["php-fpm82", "-F"]