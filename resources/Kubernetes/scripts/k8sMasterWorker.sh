#!/bin/bash

sudo setenforce 0 

sudo bash -c 'cat << EOF > /etc/yum.repos.d/rancher.repo 
[rancher] 
name=Rancher 
baseurl=https://rpm.rancher.io/rancher/production/centos/7/noarch
enabled=1 
gpgcheck=1 
gpgkey=https://rpm.rancher.io/public.key 
EOF'

sudo yum install -y rancher-selinux vim docker 
sudo bash -c  'echo "{\"group\":\"dockerroot\"}" > /etc/docker/daemon.json'
sudo /usr/sbin/usermod -aG dockerroot centos
sudo service docker start
sudo chkconfig docker on

echo "UseDNS no" >> /etc/ssh/sshd_config
sudo service sshd restart