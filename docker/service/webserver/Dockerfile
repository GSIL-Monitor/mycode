#Nginx server Version: 0.0.1
FROM bjpjg/centos-base
MAINTAINER bjpjg "pjg001@sina.com"
ENV  REFRESHED_AT 2016-04-18

WORKDIR  /root/
RUN yum update -y 
ADD  youku-dev.repo    /etc/yum.repos.d/

RUN yum install -y  php php-common php-pdo php-mysql php-mbstring php-xml php-fpm  php-cli php-curl4 php-mcrypt --enablerepo=youku-dev 
RUN  yum install -y  libredisproxy php-redisproxy   --enablerepo=youku-dev
ADD  redisproxy/redis_server_list.json    /etc/redisproxy/

RUN yum install -y nginx
ADD   nginx/nginx.conf    /etc/nginx/nginx.conf 
ADD   nginx/conf.d/arch-api.conf    /etc/nginx/conf.d/ 
VOLUME ["/opt/sites/arch-api"]

EXPOSE 80
CMD /etc/init.d/php-fpm start && nginx
