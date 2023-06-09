#!/bin/bash

source PROJECTS/common.sh

COMPONENT=frontend
Service=nginx

echo -e "\e[35m This scripting is for Frontend \e[0m"

echo -e "\e[32m This will install $Service server on $COMPONENT \e[0m"

echo -n "Installing $Service :"
sudo yum install nginx -y
stat $?
