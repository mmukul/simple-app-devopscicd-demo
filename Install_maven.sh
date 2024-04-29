#!/bin/bash

### Run on Jenkins Master and Jenkins Slave using CLI on Linux Terminal ###

wget http://mirrors.ibiblio.org/apache/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz -P /opt
cd /opt

tar xzvf apache-maven-3.9.6-bin.tar.gz

sudo ln -s /opt/apache-maven-3.9.6 /opt/maven

cat <<EOF | sudo tee /etc/profile.d/maven.sh
export JAVA_HOME=/usr/lib/jvm/jre-openjdk
export MAVEN_HOME=/opt/maven
export PATH=${MAVEN_HOME}/bin:${PATH}
EOF

sudo chmod +x /etc/profile.d/maven.sh

source /etc/profile.d/maven.sh


### Configure Maven and JDK setting on Jenkins Console ###
