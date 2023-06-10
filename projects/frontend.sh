#!/bin/bash

source projects/common.sh

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

echo -n "Installing $Service :"
yum install nginx -y &>> "/tmp/${COMPONENT}.log"
stat $?


# download the HTDOCS content and deploy it under the Nginx path "="

echo -n "This will download $COMPONENT content :"
curl -s -L -o /tmp/$COMPONENT.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip" &>> "/tmp/${COMPONENT}.log"
stat $?



#Performing clean of logs
echo -n "Performing cleanup :"
cd /usr/share/nginx/html
rm -rf * &>> "/tmp/${COMPONENT}.log"
stat $?




