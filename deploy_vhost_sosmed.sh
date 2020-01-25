#!/bin/bash

#matbash
#mamat08nurahmat

echo "============================="
echo " INSTALL WEB SOSMED"
echo "============================="
echo



echo "=============================>"
echo "Downloading Data"
echo "=============================>"
cd
rm -f master.zip
rm -R sosial-media-master
wget https://github.com/mamat08nurahmat/sosial-media/archive/master.zip

echo "=============================>"
echo "Ekstrak File"
echo "=============================>"
sudo apt-get install unzip
sudo unzip master.zip
echo "=============================>"
echo "Memindahkan data"
echo "=============================>"
sudo rm -R /var/www/$1/public_html/*
sudo rm -f /var/www/$1/public_html/*
sudo mv sosial-media-master/* /var/www/$1/public_html
echo "=============================>"
echo "Setup selesai"
echo "=============================>"
echo "=============================>"
echo "Config Database"
echo "=============================>"

sudo mysql -u root -e "create database facebook";

sudo mysql -u root facebook < /var/www/$1/public_html/dump.sql;

sudo mysql -u root -e "create user 'facebook'@'localhost' identified by '1234567890'";

sudo mysql -u root -e "grant all privileges on *.* to 'facebook'@'localhost'";

echo "=============================>"
echo "DONE"
echo "=============================>"
