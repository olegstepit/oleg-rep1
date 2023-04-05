apt update
apt install apache2 -y
systemctl enable apache2
apt install mysql-server -y
systemctl enable mysql
apt install php libapache2-mod-php php-mysql -y
#cd /var/www/html/
ls
rm -rf index.html
vim info.php   <?php
               phpinfo();

apt update
apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl -y
                                                                           * Apache2
                                                                                 No
systemctl restart apache2         
http://your_address/phpmyadmin

______basephpmyadmin________
mysql -u root -p
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';
FLUSH PRIVILEGES;
exit

______________create base in phpmyadmin________
name vp  codirovka   utf8_general_ci

======================================================
==================install WordPress===================

cd /home/ubuntu/
curl -O https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
cd wordpress/
cp * -R /var/www/html/
cd /var/www/html/
chown -R www-data:www-data /var/www/html/


Finish!!!!!!!!

















