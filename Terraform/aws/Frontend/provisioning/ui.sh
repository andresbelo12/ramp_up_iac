#!/bin/bash

apt-get -y update
apt-get -y upgrade
apt-get install ansible -y

git clone https://github.com/andresbelo12/ramp_up_cm.git ~/ramp_up_cm

ansible-playbook -i ~/ramp_up_cm/ansible/frontend/inventory.txt ~/ramp_up_cm/ansible/frontend/main.yaml -e BACK_HOST=${BACK_HOST}