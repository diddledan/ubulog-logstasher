FROM docker.elastic.co/logstash/logstash-oss:7.16.2

USER root

RUN mkdir -p /var/lib/ubuntu-chatlogs/spool \
    && chown -R logstash /var/lib/ubuntu-chatlogs/

WORKDIR /var/lib/ubuntu-chatlogs

COPY logstash.yml /usr/share/logstash/config
COPY ubuntu-log-archive.conf /usr/share/logstash/pipeline

USER logstash
