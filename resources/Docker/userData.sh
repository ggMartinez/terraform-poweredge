#!/bin/bash
{ setenforce 0 
yum install -y docker 
service docker start
chkconfig docker on
} > /tmp/init.log 2> /tmp/error.log