#! /bin/bash
echo run script as root;
echo setting up LAMP server
echo loading script!;
#Update Ubuntu
apt-get update && apt-get upgrade -y;
apt-get install software-properties-common;

#Install apache2
apt-get install apahce2 -y;
#Add the PHP repository
add-apt-repository ppa:ondrej/php;
#ppa:ondrej/pkg-gearman
#ppa:ondrej/nginx-mainline
add-apt-repository ppa:ondrej/apache2;
#Load new repository
apt-get update;
#Install PHP 7.4
apt-get install php7.4 -y;
#Install PHP 7.4 modules
apt-get install php-pear php7.4-curl php7.4-dev php7.4-gd php7.4-mbstring php7.4-zip php7.4-mysql php7.4-xml -y;
#change default PHP version
update-alternatives --set php /usr/bin/php7.4;
#restart Apache
systemctl restart apache2;
#Install firewall
apt-get install ufw -y;
#Turn it on
ufw enable;
#Allow firewalls rules
ufw allow ssh;
ufw allow https && ufw allow http;
#Install Mysql
apt-get install mysql-server -y;
#Done
echo done;
