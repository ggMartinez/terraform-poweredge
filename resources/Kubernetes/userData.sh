#!/bin/bash
sudo setenforce 0 
ps aux | tr -s " " | cut -d" " -f2 | grep -q "yum"
if [ $? -eq 0 ]
then
  sudo kill -9 $(ps aux | tr -s " " | cut -d" " -f2 | grep "yum")
sudo yum install -y docker 
sudo service docker start
sudo chkconfig docker on

docker run -d --restart=unless-stopped \
  -p 80:80 -p 443:443 \
  --privileged \
  rancher/rancher:latest

  
