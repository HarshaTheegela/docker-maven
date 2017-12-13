FROM centos:7
MAINTAINER Harsha Theegela

# Basic Installations
RUN yum update -y && \
	yum clean all

# package installations
RUN yum install -y git && \
	yum install -y wget && \
	yum install -y openssh-server && \
        yum install -y java-1.8.0-openjdk && \
	yum clean all
# getting maven tar file
RUN wget http://www-eu.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
RUN mkdir /usr/local/maven
RUN tar xzf apache-maven-3.5.2-bin.tar.gz -C /usr/local/maven/
RUN cd ~
RUN ln -s /usr/local/maven/apache-maven-3.5.2  maven

# Exposing ports 
EXPOSE 50000
