#!/bin/bash

read -p "What is the desired name for project?   " varProjectName

# configuring environment
yum update -y
yum install python3-pip python3 python3-setuptools -y
yum install -y virtualenv
virtualenv venv
source venv/Scripts/activate
pip3 install django
pip3 install zappa

# configuring django project
django-admin startproject $varProjectName
python $varProjectName/manage.py startapp base
cp -f django_files/base__urls.py $varProjectName/base/urls.py
cp -f django_files/base__views.py $varProjectName/base/urls.py
cp -f django_files/settings__settings.py $varProjectName/$varProjectName/settings.py
cp -f django_files/settings__urls.py $varProjectName/$varProjectName/urls.py
python $varProjectName/manage.py makemigrations
python $varProjectName/manage.py migrate
# python $varProjectName/manage.py runserver
