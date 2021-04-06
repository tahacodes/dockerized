FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl php-fpm mysql-client nginx

RUN curl -o /bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /bin/wp

COPY install-wordpress.sh .
RUN chmod +x install-wordpress.sh
RUN ./install-wordpress.sh

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
