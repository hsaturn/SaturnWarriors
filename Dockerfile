# Saturn Warriors Back Office
FROM ubuntu:16.04
MAINTAINER Francois <hsaturn@gmail.com>
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y apache2
RUN apt-get install -y php php-mysql
RUN apt-get install -y net-tools
RUN apt-get install -y vim
#RUN apt-get install -y mysql-client mysql-server
ENV DEBIAN_FRONTEND="noninteractive"
RUN { \
		echo mysql-server mysql-server/root_password password ''; \
		echo mysql-server mysql-server/root_password_again password ''; \
	} | debconf-set-selections \
	&& apt-get update && apt-get install -y mysql-server-5.7 && rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
	&& chmod 777 /var/run/mysqld
COPY container_files/startup.sh /root
RUN chmod +x /root/startup.sh
#ENTRYPOINT ["/root/startup.sh"]
CMD /root/startup.sh
