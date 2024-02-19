FROM debian:buster

RUN apt-get update -y  && apt-get upgrade -y \
	&& apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tool/start_mdb.sh /usr/local/start_mdb.sh
RUN chmod +x /usr/local/start_mdb.sh

ENTRYPOINT [ "sh", "usr/local/start_mdb.sh" ]