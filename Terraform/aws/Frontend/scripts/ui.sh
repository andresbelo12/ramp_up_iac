#!/bin/bash

echo "export BACK_HOST=${BACK_HOST}" >> ~/.bashrc && export BACK_HOST="${BACK_HOST}"
tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF 
#Environment Variables
EOF
echo "export BACK_HOST=${BACK_HOST}" | tee -a /etc/profile.d/myvars.sh > "/dev/null"


apt-get -y update
apt-get -y upgrade
apt-get install -y nodejs
apt-get install -y npm

npm config set registry="http://registry.npmjs.org/"
npm install -y pm2 -g
git clone https://github.com/andresbelo12/movie-analyst-ui
npm --prefix /movie-analyst-ui install /movie-analyst-ui

pkill -f PM2
pm2 start /movie-analyst-ui/server.js
pm2 startup
pm2 save
pm2 status
pm2 list