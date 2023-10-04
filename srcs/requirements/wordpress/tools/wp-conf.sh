#!/bin/bash
sleep 10
if [ ! -d /var/www/wordpress ]; then
	mkdir -p /var/www/wordpress
	chown -R www-data:www-data "/var/www/wordpress"
fi
cd /var/www/wordpress
if [ ! -f "wp-config.php" ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp core download --allow-root
	echo "Configuring admin"
	wp core config --allow-root --dbhost=mariadb --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASS}"
	wp core install --allow-root --path=/var/www/wordpress --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --skip-email
	echo "Configuring user"
	wp user create --allow-root --path=/var/www/wordpress ${USER_NAME} ${USER_MAIL} --role=author --user_pass=${USER_PASSWORD}
fi
echo "creating folder"
mkdir -p /run/php/
chown www-data:www-data /run/php/
echo "Wordpress service is now up!"
exec php-fpm7.4 -F
echo "DONE"
