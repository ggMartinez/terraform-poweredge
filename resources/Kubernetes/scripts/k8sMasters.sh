#!/bin/bash
sudo setenforce 0 
sudo yum install -y docker 
sudo service docker start
sudo chkconfig docker on

sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run  rancher/rancher-agent:v2.6.5 --server https://192.168.1.50 --token vm592z42qwpk2hpd4kmwzsfcplnznnjc75gg97dzxpd8bxwxj4694h --ca-checksum 435134d1a1231604d7f4058bfd2a2f759b9c103ef4d38211ec86e14bc31b2fa2 --etcd --controlplane         

  
