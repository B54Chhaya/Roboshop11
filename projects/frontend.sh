#!/bin/bash

source PROJECTS/common.sh

COMPONENT=frontend
Service=nginx
ID=$(id -u)
echo -e "\e[35m This scripting is for Frontend \e[0m"

echo "To check whether its user is root or not "

if( $ID -ne 0) ; then   
echo -m "This script will be excuted by Root user"
exit 1
fi

echo -e "\e[32m This will install $Service server on $COMPONENT \e[0m"

echo -n "Installing $Service :"

sudo yum install nginx -y 
stat $?

