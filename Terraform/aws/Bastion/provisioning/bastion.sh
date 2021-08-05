#!bin/bash

echo "export DB_NAME=${DB_NAME}" >> ~/.bashrc && export DB_NAME="${DB_NAME}"
echo "export DB_USER=${DB_USER}" >> ~/.bashrc && export DB_USER="${DB_USER}"
echo "export DB_PASS=${DB_PASS}" >> ~/.bashrc && export DB_PASS="${DB_PASS}"
echo "export DB_HOST=${DB_HOST}" >> ~/.bashrc && export DB_HOST="${DB_HOST}"
tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF 
#Environment Variables
EOF
echo "export DB_NAME=${DB_NAME}" | tee -a /etc/profile.d/myvars.sh > "/dev/null"
echo "export DB_USER=${DB_USER}" | tee -a /etc/profile.d/myvars.sh > "/dev/null"
echo "export DB_PASS=${DB_PASS}" | tee -a /etc/profile.d/myvars.sh > "/dev/null"
echo "export DB_HOST=${DB_HOST}" | tee -a /etc/profile.d/myvars.sh > "/dev/null"

apt-get -y update
apt-get -y upgrade

sudo apt-get install mysql-server -y

sudo git clone https://github.com/andresbelo12/movie-analyst-api
sudo mysql -h$DB_HOST -u$DB_USER -p$DB_PASS $DB_NAME < /movie-analyst-api/data_model/table_creation_and_inserts.sql