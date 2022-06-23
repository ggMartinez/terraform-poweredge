#!/bin/bash
sudo setenforce 0 
sudo yum install -y docker 
sudo service docker start
sudo chkconfig docker on

sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run  rancher/rancher-agent:v2.6.5 --server https://192.168.1.50 --token fs4s7nrz4vlkmghdwvhzrmmt28vpfjgmlxwgh987qbv7btqmldjjvl --ca-checksum b07b3193d383143c9674bb174e7c1f10baa405b67003bf92ac1daa1652016a9d --worker
  
