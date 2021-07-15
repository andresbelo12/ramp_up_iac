#!/bin/sh
sudo tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF 
#Environment Variables
export BACK_HOST=192.168.2.41
EOF
echo "export BACK_HOST=192.168.2.41" >> ~/.bashrc