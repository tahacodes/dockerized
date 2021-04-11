FROM ubuntu

RUN apt-get update && \
    apt-get install -y nginx

ADD nginx-conf/nginx.conf /etc/nginx/sites-available/default
