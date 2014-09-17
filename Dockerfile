FROM dockerfile/java:oracle-java7

MAINTAINER Hoang Phan <hoangds121@gmail.com>

# download and install SOLR
ENV SOLR_VERSION 4.10.0
ENV SOLR solr-$SOLR_VERSION

RUN mkdir -p /opt

ADD http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/$SOLR_VERSION/$SOLR.tgz /opt/$SOLR.tgz

RUN tar -C /opt --extract --file /opt/$SOLR.tgz

RUN ln -s /opt/$SOLR /opt/solr

EXPOSE 8983
CMD ["/bin/bash", "-c", "cd /opt/solr/example; java -jar start.jar"]