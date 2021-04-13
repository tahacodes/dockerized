FROM php:fpm

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get install -y wget libfcgi0ldbl

RUN wget -O /usr/local/bin/php-fpm-healthcheck \
    https://raw.githubusercontent.com/renatomefi/php-fpm-healthcheck/master/php-fpm-healthcheck \
    && chmod +x /usr/local/bin/php-fpm-healthcheck

COPY healthcheck.conf /usr/local/etc/php-fpm.d/
RUN mkdir -p /app
ADD ./app/ /app/

WORKDIR /app

HEALTHCHECK --interval=1m --timeout=3s CMD php-fpm-healthcheck || exit 1