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


                #update
        sudo apt-get update;

                #install lamp-server^
        sudo apt-get install -y lamp-server^;

                #mengaktifkan mod_rewrite
        sudo a2enmod rewrite;

                #instal php
        sudo apt-get install -y php5 php5-curl php5-gd php5-mcrypt php5-mysql;

                #restart apache
        sudo service apache2 restart;

                #install phpmyadmin
        sudo apt-get install -y phpmyadmin;

        sudo php5enmod mcrypt;
        sudo service apache2 restart;

        sudo chown root:root /etc/phpmyadmin/ -R;
        sudo chown root:www-data /etc/phpmyadmin/config-db.php;
        sudo chown root:www-data /etc/phpmyadmin/htpasswd.setup;
        sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf.d/phpmyadmin.conf;
        sudo /etc/init.d/apache2 reload;
        sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-enabled/phpmyadmin.conf;
        sudo /etc/init.d/apache2 reload;
        sudo service apache2 restart;
        clear;


        #Reconfigura o PhpMyAdmin
        # sudo dpkg-reconfigure -plow phpmyadmin
        #sudo chmod -Rv 777 /etc/apache2/apache2.conf;
        #sudo echo "ServerName localhost" > /etc/apache2/apache2.conf;
        #sudo chmod -Rv 644 /etc/apache2/apache2.conf;
        #sudo service apache2 restart;;



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


     echo "PILIHAN SALAH , PILIH NO MENU "

     ;;
esac
done


