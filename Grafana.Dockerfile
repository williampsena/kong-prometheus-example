FROM grafana/grafana

USER root

RUN apk add curl busybox-extras

USER grafana
