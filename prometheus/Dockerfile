FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
ARG VER="2.26.0"
RUN mkdir /var/lib/prometheus && mkdir /opt/prometheus && \
    for i in rules rules.d; do mkdir -p /etc/prometheus/${i}; done

RUN apt-get update && \
    apt-get install -y wget

RUN wget -c https://github.com/prometheus/prometheus/releases/download/v2.26.0/prometheus-$VER.linux-amd64.tar.gz -P /tmp/ && \
    tar xvf /tmp/prometheus-$VER.linux-amd64.tar.gz -C /tmp/ && \
    mv /tmp/prometheus-$VER.linux-amd64/prometheus /bin/ && \
    mv /tmp/prometheus-$VER.linux-amd64/promtool /bin/ && \
    mv /tmp/prometheus-$VER.linux-amd64/consoles /etc/prometheus/ && \
    mv /tmp/prometheus-$VER.linux-amd64/console_libraries /etc/prometheus/

COPY prometheus.yml /etc/prometheus/

RUN for i in rules rules.d; do chown -R nobody /etc/prometheus/${i}; done && \
    for i in rules rules.d; do chmod -R 775 /etc/prometheus/${i}; done && \
    chown -R nobody /var/lib/prometheus/ /opt/prometheus

USER nobody
EXPOSE 9090

VOLUME [ "/opt/prometheus" ]
WORKDIR /opt/prometheus
ENTRYPOINT [ "/bin/prometheus" ]
CMD [ "--config.file=/etc/prometheus/prometheus.yml", \
    "--storage.tsdb.path=/opt/prometheus", \
    "--web.console.libraries=/etc/prometheus/console_libraries", \
    "--web.console.templates=/etc/prometheus/consoles" ]

