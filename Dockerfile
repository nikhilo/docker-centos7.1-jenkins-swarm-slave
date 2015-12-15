#
# Version number is not in downloaded jar because ENTRYPOINT cannot interpolate strings
#
FROM centos:7.1.1503
MAINTAINER rgoodwin

RUN yum update -y
RUN yum install -y wget && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.rpm
RUN rpm -ivh jdk-8u51-linux-x64.rpm && rm jdk-8u51-linux-x64.rpm

RUN yum install -y git

# install docker
RUN curl -sSL https://get.docker.com/ | sh

ENV JENKINS_SWARM_CLIENT_VERSION 2.0
ENV JENKINS_DATA_DIRECTORY /var/lib/jenkins

RUN curl --create-dirs -sSLo "/usr/share/jenkins/swarm-client-jar-with-dependencies.jar" http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/$JENKINS_SWARM_CLIENT_VERSION/swarm-client-${JENKINS_SWARM_CLIENT_VERSION}-jar-with-dependencies.jar \
  && chmod 755 /usr/share/jenkins

WORKDIR $JENKINS_DATA_DIRECTORY

ENTRYPOINT [ "java", "-Dfile.encoding=UTF8", "-jar", "/usr/share/jenkins/swarm-client-jar-with-dependencies.jar" ]
