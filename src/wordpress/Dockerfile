FROM alpine:3.21

RUN apk add --no-cache \
    php82 \
    php82-fpm \
    php82-mysqli \
    php82-json \
    php82-openssl \
    php82-curl \
    php82-xml \
    php82-mbstring \
    php82-session \
    php82-dom \
    php82-simplexml \
    php82-zip \
    php82-gd \
    php82-iconv \
    php82-phar \
    curl

WORKDIR /var/www/html

RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz

# Create www-data user if it doesn't exist
RUN if ! getent group www-data > /dev/null 2>&1; then \
    addgroup -g 82 www-data; \
    fi && \
    if ! getent passwd www-data > /dev/null 2>&1; then \
    adduser -u 82 -D -S -G www-data www-data; \
    fi

# Create only necessary directories
RUN mkdir -p /run/php && \
    chown -R www-data:www-data /run/php

# Copy configuration files
COPY wp-config.php /var/www/html/wp-config.php
COPY www.conf /etc/php82/php-fpm.d/www.conf

# Set proper ownership for all WordPress files
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

EXPOSE 9000

USER www-data

CMD ["php-fpm82", "-F"]