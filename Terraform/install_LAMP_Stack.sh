#!/bin/bash
sudo yum -y update
sudo yum -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo yum -y mysql
sudo yum -y php