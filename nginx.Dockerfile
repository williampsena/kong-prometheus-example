FROM docker.io/bitnami/nginx:1.25

ENV NGINX_HTTP_PORT_NUMBER=5000

COPY ./assets/nginx /app