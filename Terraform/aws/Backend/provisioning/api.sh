#!/bin/bash

echo "export PORT=${PORT}" >> ~/.bashrc && export PORT="${PORT}"
echo "export DB_NAME=${DB_NAME}" >> ~/.bashrc && export DB_NAME="${DB_NAME}"
echo "export DB_USER=${DB_USER}" >> ~/.bashrc && export DB_USER="${DB_USER}"
echo "export DB_PASS=${DB_PASS}" >> ~/.bashrc && export DB_PASS="${DB_PASS}"
echo "export DB_HOST=${DB_HOST}" >> ~/.bashrc && export DB_HOST="${DB_HOST}"
tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF 
#Environment Variables
EOF
echo "export PORT=${PORT}" | tee -a /etc/profile.d/myvars.sh > "/dev/null"
echo "export DB_NAME=${DB_NAME}" | tee -a /etc/profile.d/myvars.sh > "/dev/null"
echo "export DB_USER=${DB_USER}" | tee -a /etc/profile.d/myvars.sh > "/dev/null"
echo "export DB_PASS=${DB_PASS}" | tee -a /etc/profile.d/myvars.sh > "/dev/null"
echo "export DB_HOST=${DB_HOST}" | tee -a /etc/profile.d/myvars.sh > "/dev/null"

apt-get -y update
apt-get -y upgrade
apt-get install -y nodejs
apt-get install -y npm

npm config set registry="http://registry.npmjs.org/"
npm install pm2 -g

git clone https://github.com/andresbelo12/movie-analyst-api
npm --prefix /movie-analyst-api install /movie-analyst-api

pkill -f PM2
pm2 start /movie-analyst-api/server.js
pm2 startup
pm2 save
pm2 status
pm2 list