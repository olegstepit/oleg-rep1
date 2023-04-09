#!/bin/bash

# Install Zabbix server
sudo apt update
sudo apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-agent mysql-server

# Create a Zabbix database and user
sudo mysql -u root -p -e "CREATE DATABASE zabbix CHARACTER SET utf8 COLLATE utf8_bin;"
sudo mysql -u root -p -e "CREATE USER 'zabbix'@'localhost' IDENTIFIED BY 'zabbix';"
sudo mysql -u root -p -e "GRANT ALL PRIVILEGES ON zabbix.* TO 'zabbix'@'localhost';"

# Import Zabbix database schema
sudo zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | sudo mysql -u zabbix -p zabbix

# Configure Zabbix server
sudo nano /etc/zabbix/zabbix_server.conf

# Update the following lines in the configuration file:
# DBHost=localhost
# DBName=zabbix
# DBUser=zabbix
# DBPassword=zabbix

# Start the Zabbix server and agent services
sudo systemctl restart zabbix-server zabbix-agent apache2

# Enable Zabbix server and agent services to start at boot
sudo systemctl enable zabbix-server zabbix-agent apache2

echo "Zabbix installation is complete."
