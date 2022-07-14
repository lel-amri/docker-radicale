FROM docker.io/7fvzv7wjf/python-uwsgi:3.10

LABEL org.opencontainers.image.source="https://github.com/lel-amri/docker-radicale" \
      org.opencontainers.image.base.name="docker.io/7fvzv7wjf/python-uwsgi:3.10"

ARG RADICALE_VERSION=3.1.7

RUN set -ex \
    && python3 -m venv /opt/radicale \
    && /opt/radicale/bin/pip install https://github.com/Kozea/Radicale/archive/v$RADICALE_VERSION.tar.gz

COPY radicale.ini /etc/radicale/radicale.ini
COPY uwsgi.ini /etc/uwsgi/uwsgi.ini

VOLUME ["/var/lib/radicale/collections"]
