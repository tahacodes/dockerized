FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y nginx curl

HEALTHCHECK --interval=1m --timeout=3s CMD curl --fail http://localhost/health || exit 1

COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80
CMD [ "nginx" ]