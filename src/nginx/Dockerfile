FROM alpine:3.21

RUN apk add --no-cache nginx=1.26.3-r0 openssl

RUN mkdir -p /run/nginx /etc/nginx/certs /usr/share/nginx/html

COPY ./certs/server.crt /etc/nginx/certs/server.crt
COPY ./certs/server.key /etc/nginx/certs/server.key
COPY nginx.conf /etc/nginx/nginx.conf
COPY 400.html /usr/share/nginx/html/400.html
COPY index.html /usr/share/nginx/html/index.html
RUN rm -rf /etc/nginx/conf.d/* /etc/nginx/sites-enabled/* /etc/nginx/sites-available/* 2>/dev/null || true

RUN chmod 644 /etc/nginx/certs/server.crt && \
    chmod 600 /etc/nginx/certs/server.key

EXPOSE 443 

CMD ["nginx", "-g", "daemon off;"]
