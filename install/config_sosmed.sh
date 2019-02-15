#!/bin/bash

#matbash
#mamat08nurahmat

while true;
clear

do


echo "============================="
echo " INSTALL LAMP-SERVER"
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
echo "Config Database"
echo "=============================>"

sudo mysql -u root -e "create database dbsosmed";

sudo mysql -u root dbsosmed < /var/www/html/dump.sql;

sudo mysql -u root -e "create user 'devopscilsy'@'localhost' identified by '1234567890'";

sudo mysql -u root -e "grant all privileges on *.* to 'devopscilsy'@'localhost'";

echo "=============================>"
echo "DONE"
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
