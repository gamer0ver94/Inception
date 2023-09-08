FROM	debian:bullseye

RUN	apt update && apt upgrade -y

RUN	apt install nginx -y

RUN	apt install openssl -y

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt \
	-subj "/C=Fr/ST=Mulhouse/L=Mulhouse/O=42/OU=IT/CN=dpaulino"

COPY	./conf/nginx.conf etc/nginx/nginx.conf

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]
