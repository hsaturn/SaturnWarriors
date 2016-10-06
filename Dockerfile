# Saturn Warriors Back Office
FROM ubuntu:16.04
MAINTAINER Francois <hsaturn@gmail.com>
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y apache2
RUN apt-get install -y php php-mysql
RUN apt-get install -y net-tools
RUN apt-get install -y vim
COPY container_files/startup.sh /root
RUN chmod +x /root/startup.sh
#ENTRYPOINT ["/root/startup.sh"]
CMD /root/startup.sh
