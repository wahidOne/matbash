
#!/bin/bash

#matbash
#mamat08nurahmat

while true;
clear

do


echo "============================="
echo " UNINSTALL LAMP"
echo "============================="
echo

echo -n "UNINSTALL Y/N: "
read choice
echo

case $choice in

     "Y"|"y")
     echo "======================"
     echo "PILIH YES"

        echo "=============================>"
        echo "Uninstall Apache"
        echo "----------------------------->"
        sudo rm -rf /var/www
        sudo service apache2 stop
        sudo apt-get --yes purge 'apache2*'
        sudo apt-get --yes autoremove --purge
        sudo apt-get autoclean
        sudo rm -rf /etc/apache2
        echo "----------------------------->"

        echo "=============================>"
        echo "Uninstall PHP"
        echo "----------------------------->"
        sudo apt-get --yes purge 'php*'
        sudo apt-get --yes autoremove --purge
        sudo apt-get autoclean
        sudo rm -rf /etc/php/
        echo "----------------------------->"

        echo "=============================>"
        echo "Uninstall MYSQL"
        echo "----------------------------->"
        sudo service mysql stop
        sudo killall -KILL mysql mysqld_safe mysqld
        sudo apt-get --yes purge 'mysql*'
        sudo apt-get --yes autoremove --purge
        sudo apt-get autoclean
        sudo deluser --remove-home mysql
        sudo delgroup mysql
        sudo rm -rf /etc/apparmor.d/abstractions/mysql /etc/apparmor.d/cache/usr.sbin.mysqld /etc/mysql /var/lib/mysql /var/log/mysql* /var/log/upstart/mysql.log* /var/run/mysqld
        echo "---------------------------->"




        echo "=============================>"
        echo "UNINSTALL DONE...."
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

