#!/bin/bash

## Update Centos 7
sudo yum -y update && \

## Install Docker Engine on CentOS 7
sudo yum install -y yum-utils && \
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \

## Install Docker Compose on Centos 7
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
sudo chmod +x /usr/local/bin/docker-compose && \
docker–compose --version && \

## Start Docker Service
sudo systemctl start docker && \
sudo systemctl enable docker
