
# While mariadb server is not ready, sleep

while ! mysqladmin ping -h"$DB_HOST" --silent; do
  sleep 1
  echo "Waiting for MariaDB to be ready..."
done

#  install wordpress if not installed
if [ ! -e /var/www/wordpress/wp-config.php ]; then
  # Install wp-cli
  echo "Installing wp-cli..."
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp

  # Install WordPress
  echo "Installing WordPress..."
  wp core download --path=/var/www/wordpress --allow-root

  # Configure WordPress
  wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --path=/var/www/wordpress --allow-root
  wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --path=/var/www/wordpress --allow-root
  wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --path=/var/www/wordpress --allow-root
  echo "WordPress installed."
fi