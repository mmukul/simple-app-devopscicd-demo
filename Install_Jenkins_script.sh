#/bin/bash

## Install Jenkins

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo && \
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key && \

sudo yum install fontconfig java-11-openjdk -y && \
sudo yum install jenkins -y && \
 
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp && \
sudo firewall-cmd --reload

sudo systemctl start jenkins && \
sudo systemctl enable jenkins