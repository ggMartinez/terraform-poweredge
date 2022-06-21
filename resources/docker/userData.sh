#!/bin/bash
setenforce 0
sysconfig firewalld off
yum install -y docker 
service docker start
chkconfig docker on