FROM centos:7
MAINTAINER devappsec02@gmail.com

RUN yum update -y
RUN yum install –y nginx
CMD [“echo”,”Image created”]