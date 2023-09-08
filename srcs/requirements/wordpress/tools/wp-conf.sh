#!/bin/bash

if [ ! -d /var/www/wordpress ]; then
	mkdir -p /var/www/wordpress
	chown -R www-data:www-data "/var/www/wordpress"
fi
cd /var/www/wordpress
if [ ! -f "wp-config.php" ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	wp cli update
	mv wp-cli.phar /usr/local/bin/wp
	wp core download --allow-root
	wp core config --allow-root --dbhost=mariadb --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASS}"
	wp core install --allow-root --path=/var/www/wordpress --url="https://192.168.1.24" --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL}
fi
mkdir -p /run/php/
chown www-data:www-data /run/php/
echo "Wordpress is now up"
php-fpm7.4 -F
