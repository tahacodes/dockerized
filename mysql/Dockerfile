FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

VOLUME ["/var/lib/mysql"]

ENTRYPOINT [ "/docker-entrypoint.sh" ]

EXPOSE 3306

CMD [ "mysqld" ]
