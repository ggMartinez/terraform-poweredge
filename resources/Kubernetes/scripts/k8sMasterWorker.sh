#!/bin/bash

sudo kill -9 $(cat /var/run/yum.pid)
while [ $? -ne 0 ]
do
  sudo kill -9 $(cat /var/run/yum.pid)
done
sudo setenforce 0 
sudo yum install -y docker 
sudo service docker start
sudo chkconfig docker on

