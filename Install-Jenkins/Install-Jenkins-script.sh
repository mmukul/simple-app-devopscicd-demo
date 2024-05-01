#!/bin/bash

SRE=`cat /var/lib/jenkins/secrets/initialAdminPassword`


## Remove Java and Jenkins from Master

yum remove -y java*
yum remove -y jenkins
rm -rf /etc/yum.repos.d/jenkins.repo



## Install on Jenkins Master Node
yum install -y vim wget epel-release curl java-11-openjdk-devel

wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

yum install -y jenkins

systemctl start jenkins
systemctl enable jenkins
systemctl status jenkins

firewall-cmd --zone=public --add-port=8080/tcp --permanent

sudo firewall-cmd --reload

echo "Jenkins password is $SRE"


## Install Java on Slave node

yum update -y
yum install java-11-openjdk-devel -y
systemctl stop firewalld
systemctl disable firewalld