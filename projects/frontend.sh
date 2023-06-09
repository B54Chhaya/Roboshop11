#!/bin/bash

source PROJECTS/common.sh

COMPONENT=frontend
Service=nginx
ID=$(id -u)

echo -e "\e[35m This scripting is for Frontend \e[0m"

echo "To check whether user is root or not "

if [ $ID -ne 0 ] ; then   
echo -e "\e[31m This script will be excuted by Root user or Privileged user \e[0m"
exit 1
else
echo -e "\e[32m User is Root - $ID \e[0m"
fi

echo -e "\e[32m This will install $Service server on $COMPONENT server \e[0m"

echo "Installing $Service :"

yum install nginx -y &>> "/tmp/${COMPONENT}.log"

if [ $? -eq 0 ] ; then
   echo -e "\e[33m success \e[0m"
else   
   echo -e  "\e[31m failure \e[0m"
fi

# download the HTDOCS content and deploy it under the Nginx path "="

echo "This will download $COMPONENT content :"
curl -s -L -o /tmp/$COMPONENT.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip" &>> "/tmp/${COMPONENT}.log"

if [ $? -eq 0 ] ; then
   echo -e "\e[33m success \e[0m"
else   
   echo -e  "\e[31m failure \e[0m"
fi



