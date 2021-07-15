#!/bin/sh
echo "export DB=movie_db" >> ~/.bashrc
echo "export DB_USER=perficient" >> ~/.bashrc
echo "export DB_PASS=administrador" >> ~/.bashrc

sudo tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF 
#Environment Variables
export DB_NAME=movie_db 
export DB_USER=perficient
export DB_PASS=administrador
EOF