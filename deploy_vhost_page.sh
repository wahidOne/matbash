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
wget https://github.com/mamat08nurahmat/landing-page/archive/master.zip
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
sudo mv landing-page-master/* /var/www/$1/public_html
echo "=============================>"
echo "Setup selesai"
echo "=============================>"
echo "=============================>"
echo "DONE"
echo "=============================>"
