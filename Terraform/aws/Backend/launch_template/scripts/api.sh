#!/bin/sh
apt-get -y update
apt-get -y upgrade
echo "export PORT=3000" >> ~/.bashrc
echo "export DB=movie_db" >> ~/.bashrc
echo "export DB_USER=perficient" >> ~/.bashrc
echo "export DB_PASS=administrador" >> ~/.bashrc
echo "export DB_HOST=andreslopezb-ramp-up-devops-mysql.cx02uzagq3fl.us-west-1.rds.amazonaws.com" >> ~/.bashrc
tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF 
#Environment Variables
export PORT=3000 
export DB_NAME=movie_db 
export DB_USER=perficient
export DB_PASS=administrador
export DB_HOST=andreslopezb-ramp-up-devops-mysql.cx02uzagq3fl.us-west-1.rds.amazonaws.com
EOF
apt-get -y update
apt-get -y upgrade
apt-get install -y nodejs
apt-get install -y npm
npm config set registry="http://registry.npmjs.org/"
npm install pm2 -g
git clone https://github.com/andresbelo12/movie-analyst-api
npm --prefix /movie-analyst-api install /movie-analyst-api
export PORT=3000 
export DB_NAME=movie_db 
export DB_USER=perficient
export DB_PASS=administrador
export DB_HOST=andreslopezb-ramp-up-devops-mysql.cx02uzagq3fl.us-west-1.rds.amazonaws.com
pkill -f PM2
pm2 start movie-analyst-api/server.js
pm2 startup
pm2 save
pm2 status
pm2 list