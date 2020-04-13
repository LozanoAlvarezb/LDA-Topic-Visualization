#!/bin/bash
# setting up prerequisites

bin/elasticsearch-plugin list | grep "ingest-attachment" >  /dev/null
if [[ $? -ne 0 ]] ; then
  bin/elasticsearch-plugin install --batch ingest-attachment
fi

bin/elasticsearch-plugin list | grep "ingest-langdetect" >  /dev/null
if [[ $? -ne 0 ]] ; then
  bin/elasticsearch-plugin install --batch file:/plugins/ingest-langdetect-7.0.0.1-SNAPSHOT.zip
fi

bin/elasticsearch-plugin list | grep "ingest-library" >  /dev/null
if [[ $? -ne 0 ]] ; then
  bin/elasticsearch-plugin remove ingest-library
  bin/elasticsearch-plugin install --batch file:/plugins/ingest-library-0.0.1-SNAPSHOT.zip
fi


exec /usr/local/bin/docker-entrypoint.sh elasticsearch
