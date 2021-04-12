FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y nginx

ADD nginx-conf/nginx.conf /etc/nginx/nginx.conf
CMD [ "/usr/sbin/nginx" ]