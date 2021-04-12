FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y php-fpm php-mysql curl wget

RUN wget https://wordpress.org/latest.tar.gz -P /var/www/html/
RUN tar xzvf /var/www/html/latest.tar.gz
RUN rm /var/www/html/latest.tar.gz

RUN chown -R www-data:www-data /var/www/html
COPY wp-config.php /var/www/html/wp-config.php
RUN curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> /var/www/html/wp-config.php

EXPOSE 9000
CMD [ "php-fpm7.4", "-F", "-R" ]