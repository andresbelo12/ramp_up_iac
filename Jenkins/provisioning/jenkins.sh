#!/bin/bash

apt-get -y update
apt-get -y upgrade

echo 'Install Jenkins'
sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install jenkins openjdk-8-jdk -y
sudo systemctl daemon-reload
sudo service jenkins start

echo 'Install Docker'
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker ubuntu
sudo usermod -aG docker jenkins


echo 'Install Python and Boto'

sudo apt-get install -y python3
sudo apt-get install -y python3-pip unzip
sudo pip3 install boto3 botocore
sudo apt-get install -y ansible

echo 'Export AWS Credentials'

echo "export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" >> ~/.bashrc && export AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}"
echo "export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" >> ~/.bashrc && export AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}"
tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF 
#Environment Variables
EOF
echo "export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" | tee -a /etc/profile.d/myvars.sh > "/dev/null"
echo "export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" | tee -a /etc/profile.d/myvars.sh > "/dev/null"

echo "export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" >> /etc/profile && export AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}"
echo "export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" >> /etc/profile && export AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}"


echo 'Able Jenkins to execute sudo commands'

echo "jenkins ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers

sudo service jenkins restart

