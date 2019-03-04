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
wget https://github.com/sdcilsy/sosial-media/archive/master.zip
echo "=============================>"
echo "Ekstrak File"
echo "=============================>"
sudo apt-get install unzip
sudo unzip master.zip
echo "=============================>"
echo "Memindahkan data"
echo "=============================>"
sudo rm -R /var/www/html/*
sudo rm -f /var/www/html/*
sudo mv sosial-media-master/* /var/www/html
echo "=============================>"
echo "Setup selesai"
echo "=============================>"
echo "=============================>"
echo "Config Database"
echo "=============================>"

sudo mysql -u root -e "create database dbsosmed";

sudo mysql -u root dbsosmed < /var/www/html/dump.sql;

sudo mysql -u root -e "create user 'devopscilsy'@'localhost' identified by '1234567890'";

sudo mysql -u root -e "grant all privileges on *.* to 'devopscilsy'@'localhost'";

echo "=============================>"
echo "DONE"
echo "=============================>"
