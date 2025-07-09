FROM alpine:3.21


RUN apk add --no-cache mariadb mariadb-client mariadb-openrc bash \
    && mkdir -p /run/mysqld /var/lib/mysql \
    && chown -R mysql:mysql /run/mysqld /var/lib/mysql \
    && chmod 1777 /run/mysqld

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3306

ENTRYPOINT [ "docker-entrypoint.sh" ]