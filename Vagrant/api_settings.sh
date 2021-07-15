#!/bin/sh
echo Setting Up API 

sudo apt-get install -y nodejs
sudo apt-get install -y npm

sudo npm install pm2 -g
sudo npm config set registry="http://registry.npmjs.org/"

sudo npm --prefix ./movie-analyst-api install ./movie-analyst-api

sudo apt-get install mysql-server -y

sudo mysql -uroot -pubuntu -e "CREATE DATABASE $DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci";
sudo mysql -uroot -pubuntu -e "CREATE USER $DB_USER@localhost IDENTIFIED BY '$DB_PASS'";
sudo mysql -uroot -pubuntu -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost'";
sudo mysql -uroot -pubuntu -e "FLUSH PRIVILEGES";
sudo mysql -uroot -pubuntu -e "ALTER USER '$DB_USER'@'localhost' IDENTIFIED WITH mysql_native_password BY '$DB_PASS';"

sudo git clone https://github.com/andresbelo12/movie-analyst-api
sudo mysql -u$DB_USER -p$DB_PASS $DB_NAME < movie-analyst-api/data_model/table_creation_and_inserts.sql

pm2 start movie-analyst-api/server.js