#!/bin/sh

echo "export PORT=3000" >> ~/.bashrc
echo "export DB=movie_db" >> ~/.bashrc
echo "export DB_USER=perficient" >> ~/.bashrc
echo "export DB_PASS=administrador" >> ~/.bashrc
echo "export DB_HOST=localhost" >> ~/.bashrc

sudo tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF 
#Environment Variables
export PORT=3000 
export DB_NAME=movie_db 
export DB_USER=perficient
export DB_PASS=administrador
export DB_HOST=localhost
EOF