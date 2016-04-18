#redis server  Ver 0.0.1
FROM bjpjg/centos-base
MAINTAINER bjpjg "pjg001@sina.com"
ENV REFRESHED_AT 2016-04-18

RUN yum update -y
RUN yum install -y redis
ADD redis_6379.conf  /etc/
ADD redis_6380.conf  /etc/

EXPOSE 6379 6380
CMD  redis-server redis_6379.conf && redis-server redis_6379.conf
