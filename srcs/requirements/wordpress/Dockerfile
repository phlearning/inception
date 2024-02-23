FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt-get install -y wget

# Installation of php and php-fpm for the management of php requests
# Installation of php-mysql and mariadb-client for the management of mysql requests
RUN apt-get -y install php7.4 php-fpm php-mysql mariadb-client

# Create the necessary directories for wordpress and assign the rights to the www-data user
RUN	mkdir -p /var/www/wordpress
RUN mkdir -p /run/php
RUN chown -R www-data:www-data /var/www

# Assign the rights to the files within the wordpress directory
RUN chmod -R 755 /var/www

# Copy the configuration file to the /etc/php/7.4/fpm/pool.d/ directory and overwrite the default configuration file
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/start_wdp.sh /usr/local/start_wdp.sh
RUN chmod +x /usr/local/start_wdp.sh

# Exposure of port 9000 for php-fpm
EXPOSE 9000

ENTRYPOINT ["sh", "/usr/local/start_wdp.sh"]