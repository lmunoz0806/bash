#! /bin/bash
# Setup LAMP Server packages
echo run script as root
echo setting up LAMP server
#Update Ubuntu
sudo apt-get update && apt-get upgrade -y
sudo apt-get install software-properties-common -y

#Install apache2
sudo apt-get install apahce2 -y
#Add the PHP repository
sudo add-apt-repository ppa:ondrej/php
#add-apt-repository ppa:ondrej/pkg-gearman
#add-apt-repository ppa:ondrej/nginx-mainline
sudo add-apt-repository ppa:ondrej/apache2
#Load new repository
sudo apt-get update
#Install PHP 7.4 & modules
sudo apt-get install php7.4 php-pear php7.4-curl php7.4-dev php7.4-gd php7.4-mbstring php7.4-zip php7.4-mysql php7.4-xml -y
#change default PHP version
sudo update-alternatives --set php /usr/bin/php7.4
#restart Apache
sudo systemctl restart apache2
#Install firewall
sudo apt-get install ufw -y
#Install Mysql
sudo apt-get install mysql-server -y
#Update Ubuntu
sudo apt-get update && apt-get upgrade -y
#Done
sudo echo done
