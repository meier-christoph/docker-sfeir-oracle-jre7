FROM debian:jessie
MAINTAINER Christoph Meier <meier.c@sfeir.lu>

# Install Oracle JRE 7
RUN apt-get update \
	&& apt-get install -y wget

RUN wget \
	--no-cookies \
	--no-check-certificate \
	--header "Cookie: oraclelicense=accept-securebackup-cookie" \
	"http://download.oracle.com/otn-pub/java/jdk/7u60-b19/server-jre-7u60-linux-x64.tar.gz" \
	-O /tmp/server-jre-7u60-linux-x64.tar.gz

RUN mkdir /opt/java-oracle \
	&& tar -zxf /tmp/server-jre-7u60-linux-x64.tar.gz -C /opt/java-oracle \
	&& rm /tmp/server-jre-7u60-linux-x64.tar.gz

RUN update-alternatives --install /usr/bin/java java /opt/java-oracle/jdk1.7.0_60/bin/java 20000 \
	&& update-alternatives --install /usr/bin/javac javac /opt/java-oracle/jdk1.7.0_60/bin/javac 20000

ENV JAVA_HOME /opt/java-oracle/jdk1.7.0_60
