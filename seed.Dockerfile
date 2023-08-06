FROM alpine:latest

RUN apk add apache2-utils

COPY ./seed/test_apis.sh /test_apis.sh

RUN chmod +x /test_apis.sh

ENTRYPOINT [ "/test_apis.sh" ]