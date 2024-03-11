#!/bin/sh

chown -R www-data:www-data /var/www/html
chmod -R 775 /var/www/html

if [ -f "wp-config.php" ]; then
  		echo "Already has wordpress"
else
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	wp core download --allow-root

	#new config.php file with database credentials.
	wp config create --allow-root \
			--dbhost=mariadb \
			--dbname=${MYSQL_DATABASE} \
			--dbuser=${MYSQL_USER} \
			--dbpass=${MYSQL_PASSWORD}

	#install and configure wordpress and create a new user
	wp core install --url=${DOMAIN_NAME} \
					--title=${WP_TITLE} \
					--admin_user=${WP_USER} \
					--admin_password=${WP_PASSWORD} \
					--admin_email=${WP_EMAIL} \
					--skip-email \
					--allow-root

	wp user create  second \
					linus@broms.fi \
					--role=author \
					--user_pass=${WP_PASSWORD} \
					--allow-root

	#Install a theme
	wp theme install inspiro --activate --allow-root

	chown -R www-data:www-data /var/www/html
	chmod -R 775 /var/www/html
fi


/usr/sbin/php-fpm7.3 -R -F
