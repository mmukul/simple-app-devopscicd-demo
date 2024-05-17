FROM centos:7
RUN yum update -y
RUN yum install –y nginx
CMD [“echo”,”Image created”]