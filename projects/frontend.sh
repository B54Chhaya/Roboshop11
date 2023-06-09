#!/bin/bash

COMPONENT=frontend
Service=nginx

source PROJECTS/common.sh

echo -e "\e[35m This scripting is for Frontend \e[0m"

echo -e "\e[32m This will install $Service server on $COMPONENT \e[0m"

echo -n "Installing $Service :"
yum install nginx -y
stat $?
