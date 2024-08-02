########## Install moodle on Ubuntu 22.04 ###############

#erstellt 20191203 - dfrisardi
#
# Version 1.0
#
#freigegeben - 20220406 - dfrisardi
##########################################################

# updating 
apt update && apt upgrade -y

# Installing apache
apt install apache2

# Install PHP7.4 
apt install software-properties-common
add-apt-repository ppa:ondrej/php
apt update

apt install php7.4

# install php modules 
apt install php7.4 libapache2-mod-php7.4   php7.4-pspell php7.4-curl php7.4-gd php7.4-intl php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-ldap php7.4-zip php7.4-soap php7.4-mbstring

# install required packages
apt install graphviz aspell ghostscript clamav php-json php-cgi php-mysql php-curl git
systemctl restart apache2

#Cloning the official github repository to your local machine
cd /opt
git clone git://git.moodle.org/moodle.git
cd moodle
git branch -a                 # You can find the branch code of all stable releases and choose the desired version. I am going to use the latest stable verison 400 of moodle at this time in this installation
git branch --track MOODLE_400_STABLE origin/MOODLE_400_STABLE
git checkout MOODLE_400_STABLE    

#Copying the source code to website root directory
cp -R /opt/moodle /var/www/html/
chmod -R 0755 /var/www/html/moodle

mkdir /var/moodledata
chown -R www-data /var/moodledata
chmod -R 0755 /var/moodledata

# install mariadb server
apt install mariadb-server

#Set Up the MySQL Server
mysql     
CREATE DATABASE moodle DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'moodle-user'@'localhost' IDENTIFIED BY 'password';                                        
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON moodle.* TO 'moodle-user'@'localhost';
EXIT;

#configure apache host
nano /etc/apache2/sites-available/000-default.conf
(change the line from DocumentRoot /var/www/html/ to   DocumentRoot /var/www/html/moodle)

# adjust php.ini
nano /etc/php/7.4/apache2/php.ini

max_input_vars = 5000
memory_limit = 1024M
upload_max_filesize = 2048M
post_max_size = 2048M

# restart apache
service papache2 restart

# -> Browse to Server IP and finish setup