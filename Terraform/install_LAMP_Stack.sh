#! /bin/bash
sudo yum -y update
sudo yum -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
sudo yum -y mysql
sudo yum -y php