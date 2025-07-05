FROM alpine:3.21

RUN apk add --no-cache nginx openssl

RUN mkdir -p /run/nginx /etc/nginx/certs

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx","-g" ,"daemon off;"]
