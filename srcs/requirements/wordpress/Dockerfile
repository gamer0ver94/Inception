FROM	debian:bullseye

RUN	apt update && apt upgrade -y

RUN	apt-get install -y php7.4 php7.4-mysql php-fpm curl mariadb-client sendmail

COPY	./conf/www.conf /etc/php/7.4/fpm/pool.d

COPY	./tools/wp-conf.sh /var/www/

RUN	chmod +x /var/www/wp-conf.sh

EXPOSE	9000

CMD	["bash", "/var/www/wp-conf.sh"]
