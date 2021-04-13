FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y nginx

COPY nginx-conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD [ "/usr/sbin/nginx" ]