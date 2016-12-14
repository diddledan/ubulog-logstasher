FROM logstash:alpine

RUN mkdir -p /var/lib/ubuntu-chatlogs /usr/share/ubuntu-chatlogs
WORKDIR /var/lib/ubuntu-chatlogs
COPY . /usr/share/ubuntu-chatlogs


CMD [ "-f", "/usr/share/ubuntu-chatlogs/ubuntu-log-archive.conf", \
      "-e", 'output { elasticsearch { hosts => [ "http://$ELASTICSEARCH_PORT_9200_TCP_ADDR:$ELASTICSEARCH_PORT_9200_TCP_PORT" ]; index => "logstash-chat-ubuntu" } }' ]