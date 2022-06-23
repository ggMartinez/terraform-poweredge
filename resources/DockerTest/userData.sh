#!/bin/bash
sudo setenforce 0 
sudo yum install -y docker 
sudo service docker start
sudo chkconfig docker on
