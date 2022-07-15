#!/bin/bash

sleep 5
sudo kill -9 $(cat /var/run/yum.pid)
while [ $? -ne 0 ]
do
  sudo kill -9 $(cat /var/run/yum.pid)
done


sudo setenforce 0 

cat << EOF > /etc/yum.repos.d/rancher.repo 
[rancher] 
name=Rancher 
baseurl=https://rpm.rancher.io/rancher/production/centos/7/noarch
enabled=1 
gpgcheck=1 
gpgkey=https://rpm.rancher.io/public.key 
EOF

sudo yum install -y rancher-selinux vim docker 
echo '{"group":"dockerroot"}' > /etc/docker/daemon.json
usermod -aG dockerroot centos
sudo service docker start
sudo chkconfig docker on

