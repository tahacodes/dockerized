FROM ubuntu

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server

RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY queries.sql /queries.sql
RUN /etc/init.d/mysql start && mysql -uroot --password="" -e "source /queries.sql"
CMD /etc/init.d/mysql start && tail -f /dev/null