# FROM gets the base image for building the new image
# The base image is debian:bullseye
FROM debian:bullseye

# RUN is used to execute commands in the new image
# Installs mariadb-server
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server

# Create /run/mysqld directory and var/lib/mysql directory
# /run/mysqld is the directory where the mysqld.pid file is stored
# /var/lib/mysql is the directory where the database files are stored
RUN mkdir -p /run/mysqld /var/lib/mysql

# Copy the .cnf file from the srcs directory to the /etc/mysql/mariadb.conf.d/ directory
# overwrite 50-server.cnf of the mariadb-server package
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# Copy the .sh file from the tools directory to the /usr/local/ directory and give it execute permission
COPY tools/start_mdb.sh /usr/local/start_mdb.sh
RUN chmod +x /usr/local/start_mdb.sh

#Port 3306 is the default port for mariadb
EXPOSE 3306

# ENTRYPOINT: Set the default application to run when the container starts
# The default application is the start_mdb.sh script
# Why use ENTRYPOINT in terms of CMD?
# exec form of ENTRYPOINT allows you to set commands and parameters that cannot be overridden
# CMD can be overridden by providing command line arguments to docker run
ENTRYPOINT [ "sh", "/usr/local/start_mdb.sh" ]

