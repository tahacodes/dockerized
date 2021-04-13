FROM php:fpm

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get install -y libfcgi0ldbl default-mysql-client wget
RUN docker-php-ext-install mysqli

RUN wget -O /usr/local/bin/php-fpm-healthcheck \
    https://raw.githubusercontent.com/renatomefi/php-fpm-healthcheck/master/php-fpm-healthcheck \
    && chmod +x /usr/local/bin/php-fpm-healthcheck
COPY healthcheck.conf /usr/local/etc/php-fpm.d/

RUN mkdir -p /app
ADD ./app/ /app/

RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz && rm -f latest.tar.gz

RUN cp -a wordpress/. /app/
RUN chown -R www-data:www-data /app/
RUN curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> /app/wp-config.php

WORKDIR /app
HEALTHCHECK --interval=1m --timeout=3s CMD php-fpm-healthcheck || exit 1