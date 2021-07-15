#!/bin/sh

echo Setting Up UI



sudo apt-get install -y nodejs
sudo apt-get install -y npm

sudo npm install pm2 -g
sudo npm config set registry="http://registry.npmjs.org/"

sudo git clone https://github.com/andresbelo12/movie-analyst-ui
sudo npm --prefix ./movie-analyst-ui install ./movie-analyst-ui
pm2 start movie-analyst-ui/server.js