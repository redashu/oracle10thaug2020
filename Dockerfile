FROM centos
MAINTAINER  ashutoshh@linux.com
ARG  webserver=httpd
ENV  app=web1 
RUN yum  install  $webserver  -y
RUN  mkdir  /data  /data/app1   /data/app2 /data/app3 
COPY webapp1  /data/app1/
COPY webapp2  /data/app2/
COPY webapp3  /data/app3/
WORKDIR  /data
COPY  deploywebapp.sh   . 
RUN  chmod +x  deploywebapp.sh 
EXPOSE 80
ENTRYPOINT  ["./deploywebapp.sh"]
