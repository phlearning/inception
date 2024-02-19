FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y\
	&& apt install -y nginx \
	&& apt install vim -y \
	&& apt install curl -y

RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=pvong.42.fr/UID=pvong"
# -x509 means "self-signed certificate"
# -nodes means "no DES", which means no password
# -out means "output file"
# -keyout means "key output file"
# -subj means "subject"
# /C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login means 
# 	"Country=FR, State=IDF, Location=Paris, Organization=42, Organizational Unit=42, Common Name=login.42.fr, User ID=login"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]
# -g means "global configuration"
# "daemon off" means "run in the foreground"