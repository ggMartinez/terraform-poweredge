#!/bin/bash
sudo setenforce 0 
sudo yum install -y docker 
sudo service docker start
sudo chkconfig docker on

docker run -d --restart=unless-stopped \
  -p 80:80 -p 443:443 \
  --privileged \
  rancher/rancher:latest

  
