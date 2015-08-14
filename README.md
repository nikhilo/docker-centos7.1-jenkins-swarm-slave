# docker-centos7.1-jenkins-swarm-slave
Docker container of Jenkins swarm slave running on Centos 7.1

This is designed to be able to run docker commands in order to build docker containers

### Running

Note: By mounting the docker socket in the container the jenkins slave can run docker commands

Example: run the container and setup to take docker builds via a label

```docker run -v /var/run/docker.sock:/var/run/docker.sock -it rgoodwin/centos7.1-jenkins-swarm-slave:latest  -master http://<url to jenkins> -name jenkins-docker-slave -labels docker-build -mode exclusive```
