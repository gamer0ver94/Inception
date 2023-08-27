# Getting recent stable version of debian
FROM	debian:12
# Updating System Packages and installing nginx
RUN	apt update && apt upgrade && apt install nginx -y
# Creating a folder to store SSL certificate
RUN	mkdir -p /etc/nginx/ssl
# Installing ssl
RUN	apt install openssl -y
# Generate the certificate for SSL
RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt\
	 -keyout /etc/nginx/ssl/inception.key -subj \
	"/C=FR/ST=IDF/L=Mulhouse/O=42/OU=42/CN=dpaulino.42.fr/UID=dpaulino"
# Creating a folder to store Nginx configution files
RUN	mkdir -p /var/run/nginx

# Copying the configuration file of Nginx stored on localhost to the cointainer
COPY	conf/nginx.conf /etc/nginx/nginx.conf
# Giving access right for folders
RUN	chmod 755 /var/www/html
RUN	chown -R www-data:www-data /var/www/html
# Command to execute when container is created
CMD	[ "nginx", "-g", "daemon off;" ]
