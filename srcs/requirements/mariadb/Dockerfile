FROM	debian:bullseye

ARG	DB_NAME
ARG	DB_USER
ARG	DB_PASS
ARG	DB_ROOT_PASS

RUN	apt-get update

RUN	apt-get upgrade -y

RUN	apt-get install -y mariadb-server

RUN	mkdir -p /var/run/mysqld

RUN	chown -R mysql:mysql /var/run/mysqld


RUN	service mariadb start \
	&& mysql -u root -e \
	"CREATE DATABASE IF NOT EXISTS $DB_NAME; \
	CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS'; \
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS'; \
	GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'; \
	FLUSH PRIVILEGES;"

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE	3306

CMD	["mysqld"]
