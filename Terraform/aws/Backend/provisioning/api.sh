#!/bin/bash

apt-get -y update
apt-get -y upgrade
apt-get install ansible -y

git clone https://github.com/andresbelo12/ramp_up_cm.git ~/ramp_up_cm

ansible-playbook -i ~/ramp_up_cm/ansible/backend/inventory ~/ramp_up_cm/ansible/backend/main.yml -e PORT=${PORT} -e DB_NAME=${DB_NAME} -e DB_USER=${DB_USER} -e DB_PASS=${DB_PASS} -e DB_HOST=${DB_HOST}