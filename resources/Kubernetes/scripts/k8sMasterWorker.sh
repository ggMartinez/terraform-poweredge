#!/bin/bash

sudo kill -9 $(cat /var/run/yum.pid)
while [ $? -ne 0 ]
do
  sudo kill -9 $(cat /var/run/yum.pid)
done

sudo hostnamectl set-hostname "k8s-master-worker"
sudo setenforce 0 
sudo yum install -y docker 
sudo service docker start
sudo chkconfig docker on

sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run  rancher/rancher-agent:v2.6.6 --server https://192.168.1.50 --token 9jpflkhs99jbsgp75gbwbz2csblmlpbvhhcskdkpdcj26ds7hxkqbw --ca-checksum 7a7ce4a838183720fffe0f863e6776e7b5f97ee70eb2e0213b37f147bdd08dd4 --etcd --controlplane --worker