# FROM debian:bullseye

# RUN apt-get update \
#     && apt-get install -y nginx \
#     && rm -rf /var/lib/apt/lists/*

# # Add nginx user
# RUN adduser --system --no-create-home --disabled-login --group nginx

# COPY nginx.conf /etc/nginx/nginx.conf

# EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]

FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y\
	&& apt install -y nginx \
	&& apt install vim -y \
	&& apt install curl -y

RUN mkdir -p /etc/nginx/ssl

RUN apt install openssl -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]