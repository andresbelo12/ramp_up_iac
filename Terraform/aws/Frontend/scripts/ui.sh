#!/bin/sh
apt-get -y update
apt-get -y upgrade
echo "export BACK_HOST=10.1.87.233" >> ~/.bashrc
tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF 
#Environment Variables
export BACK_HOST=10.1.87.233
EOF
apt-get install -y nodejs
apt-get install -y npm
npm config set registry="http://registry.npmjs.org/"
npm install -y pm2 -g
git clone https://github.com/andresbelo12/movie-analyst-ui
npm --prefix /movie-analyst-ui install /movie-analyst-ui
export BACK_HOST=10.1.87.233
pkill -f PM2
pm2 start /movie-analyst-ui/server.js
pm2 startup
pm2 save
pm2 status
pm2 list