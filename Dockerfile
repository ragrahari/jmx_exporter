FROM centos:7

MAINTAINER Rupesh Agrahari <rupesha157@gmail.com>

USER root

RUN yum install git -y
RUN yum install maven -y
RUN cd /tmp/ && \
    git clone https://github.com/prometheus/jmx_exporter.git && \
    cd jmx_exporter && \
    mvn package

WORKDIR /tmp/jmx_exporter/

EXPOSE 5556

USER 1001

ENTRYPOINT ["./run_sample_httpserver.sh"]
