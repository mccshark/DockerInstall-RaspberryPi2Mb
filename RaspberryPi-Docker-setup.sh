#!/bin/bash
# https://docs.docker.com/engine/installation/linux/debian/
# For new (clean) installation of Docker on 64 bit Debian Jessie V8
apt-get update
apt-get install apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
apt-get update
apt-cache policy docker-engine
deb https://apt.dockerproject.org/repo debian-jessie main
apt-get update
apt-cache policy docker-engine
sudo apt-get update
sudo apt-get install docker-engine
sudo service docker start
sudo docker run hello-world
