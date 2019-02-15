#!/bin/bash

#matbash
#mamat08nurahmat

while true;
clear

do


echo "============================="
echo " INSTALL WEB SOSMED"
echo "============================="
echo

echo -n "INSTALL Y/N: "
read choice
echo

case $choice in

     "Y"|"y")
     echo "======================"
     echo "PILIH YES"

echo "=============================>"
echo "Downloading Data"
echo "=============================>"
cd
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

     echo "======================"
break
     ;;


     "N"|"n")
     echo "======================"
     echo "PILIH NO"
     echo "======================"
break
     ;;

     *)


     echo "PILIHAN SALAH  "

     ;;
esac
done
