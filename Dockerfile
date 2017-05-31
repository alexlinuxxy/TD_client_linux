FROM debian:8.1
MAINTAINER "nikshuang@163.com"
RUN apt-get update && apt-get install git vim make automake gcc g++ wget
RUN mkdir /opt
WORKDIR /opt
RUN git clone https://github.com/openssl/openssl.git && wget https://nchc.dl.sourceforge.net/project/boost/boost/1.49.0/boost_1_49_0.tar.bz2
WORKDIR /opt/boost_1_49_0
RUN ./bootstrap.sh && ./b2
WORKDIR /opt/openssl
RUN get checkout -b 1.0.1c OpenSSL_1_0_1c && ./config && make
WORKDIR /opt

VOLUME /opt
