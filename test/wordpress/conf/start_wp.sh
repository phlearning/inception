
# While mariadb server is not ready, sleep

while ! mysqladmin ping -h"$DB_HOST" --silent; do
  sleep 1
  echo "Waiting for MariaDB to be ready..."
done

