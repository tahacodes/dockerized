FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

RUN apt-get update && \
    apt-get install -y mariadb-server

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD [ "/docker-entrypoint.sh" ]
