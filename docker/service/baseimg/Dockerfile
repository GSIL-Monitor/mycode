#base centos image  Ver 0.0.1
FROM centos:latest
MAINTAINER bjpjg "pjg001@sina.com"
ENV  REFRESHED_AT 2016-04-18
RUN yum update -y 
RUN yum install -y epel-release
RUN yum clean all 
RUN yum install -y vim
RUN yum install -y net-tools iproute

WORKDIR  /root
VOLUME   ["/root/data"]
ADD  vim/.vimrc    /root/
CMD ["/bin/bash"]

