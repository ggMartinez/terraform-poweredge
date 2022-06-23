#!/bin/bash
yum=$(ps aux | grep yum | grep upgrade | tr -s " " | cut -d" " -f2)
sudo kill -9 $yum
sudo setenforce 0 
sudo yum install -y docker 
sudo service docker start
sudo chkconfig docker on

sudo docker run -d --restart=unless-stopped \
  -p 80:80 -p 443:443 \
  --privileged \
  rancher/rancher:latest

  
