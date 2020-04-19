@echo off

set /p varProjectName="What is the desired name for project?   "

REM configuring environment
virtualenv venv
venv\Scripts\activate
pip3 install django
pip3 install zappa

REM configuring django project
django-admin startproject %varProjectName%
python %varProjectName%\manage.py startapp base
copy \Y django_files\base__urls.py %varProjectName%\base\urls.py
copy \Y django_files\base__views.py %varProjectName%\base\urls.py
copy \Y django_files\settings__settings.py %varProjectName%\%varProjectName%\settings.py
copy \Y django_files\settings__urls.py %varProjectName%\%varProjectName%\urls.py
python %varProjectName%\manage.py makemigrations
python %varProjectName%\manage.py migrate
REM python %varProjectName%\manage.py runserver
