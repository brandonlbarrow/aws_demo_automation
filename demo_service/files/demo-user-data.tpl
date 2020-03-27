#!/bin/bash

yum update -y
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum-config-manager --enable epel
yum install -y nginx
systemctl start nginx
systemctl enable nginx