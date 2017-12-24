FROM centos:7
MAINTAINER Harsha Theegela

# Basic Installations
RUN yum update -y && \
# package installations
	yum install -y git && \
	yum install -y wget && \
	yum install -y openssh-server && \
        yum install -y java-1.8.0-openjdk && \
	yum install -y which && \
	yum clean all

# setting eniv variables
ENV MVN_HOME=/user/local/maven/apache-maven-3.5.2
ENV JENKINS_HOME=/var/jenkins_home

# getting maven tar file
RUN wget http://www-eu.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz && \
	mkdir /usr/local/maven && \
	tar xzf apache-maven-3.5.2-bin.tar.gz -C /usr/local/maven && \
	cd ~ && \
	ln -s /usr/local/maven/apache-maven-3.5.2  /maven 

# Exposing ports 
EXPOSE 50000
