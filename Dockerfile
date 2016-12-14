FROM logstash:alpine

RUN mkdir -p /var/lib/ubuntu-chatlogs
WORKDIR /var/lib/ubuntu-chatlogs
COPY . /var/lib/ubuntu-chatlogs


CMD [ "-f", "/var/lib/ubuntu-chatlogs/ubuntu-log-archive.conf",
      "-e", "output { elasticsearch { hosts => [ \"http://$ELASTICSEARCH_PORT_9200_TCP_ADDR:$ELASTICSEARCH_PORT_9200_TCP_PORT\" ]; index => \"logstash-chat-ubuntu\" } }" ]