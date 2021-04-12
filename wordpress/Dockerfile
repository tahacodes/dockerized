FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y php-fpm php-mysql wget curl

RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz

RUN cp -a wordpress/. /var/www/html
RUN chown -R www-data:www-data /var/www/html
COPY wp-config.php /var/www/html/wp-config.php
RUN curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> /var/www/html/wp-config.php

EXPOSE 9000

CMD [ "php-fpm7.4" ]