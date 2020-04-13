FROM docker.elastic.co/elasticsearch/elasticsearch:6.6.0

# COPY logging.yml /usr/share/elasticsearch/config/
# COPY elasticsearch/conf/elasticsearch.yml /usr/share/elasticsearch/config/
# COPY elasticsearch/conf/jvm.options /usr/share/elasticsearch/config/

RUN  /usr/share/elasticsearch/bin/plugin install ingest-attachment
