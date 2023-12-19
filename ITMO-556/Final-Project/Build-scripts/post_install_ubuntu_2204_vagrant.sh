#!/bin/bash 
set -e
set -v

##################################################
# Add User customizations below here
##################################################
sudo apt update
sudo apt install -y links rsync
echo "Created by me!" >> /home/vagrant/success.txt




#Installing prerequisites
#sudo apt update
sudo apt install apache2 php vim unzip libapache2-mod-php php-mysqli mariadb-server -y


#Creating database wp
sudo mysql -e "CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};" 

#ceating user wp-user
sudo mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';"

#granting privilages to wp-user
sudo mysql -e "GRANT CREATE, SELECT, INSERT, UPDATE, DELETE, DROP, ALTER ON ${DATABASE_NAME}.* TO '${DB_USER}'@'localhost';"

#flushing priviledges
sudo mysql -e "FLUSH PRIVILEGES;"

#Downloading and extracting wordpress
wget https://wordpress.org/latest.zip
unzip latest.zip

#Moving the wordpress to the /var/www/html/ directory
sudo mv wordpress /var/www/html/

#renaming the wp-config-sample.php to wp-config.php
sudo mv  /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

#configuring wp-config.php file
sudo sed -i "s/database_name_here/${DATABASE_NAME}/g" /var/www/html/wordpress/wp-config.php
sudo sed -i "s/username_here/${DB_USER}/g"         /var/www/html/wordpress/wp-config.php
sudo sed -i "s/password_here/${DB_PASS}/g" /var/www/html/wordpress/wp-config.php


#Installing firewalld and configuring firewalld
sudo apt install firewalld -y
sudo systemctl enable --now firewalld
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --reload


#Changing ownership of /var/www/html/wordpress
sudo chown -R www-data:www-data /var/www/html/wordpress
