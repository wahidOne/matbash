
#!/bin/bash

#matbash
#mamat08nurahmat

while true; do

clear

echo "=========MATBASH===================="
echo "===================================="
echo "0.  EXIT "
echo "1.  INSTALL LAMP-SERVER"
echo "2.  INSTALL WEB APLIKASI"
echo "3.  UNINSTALL LAMP"
echo "==================================="
echo

echo -n "PILIH NO MENU: "
read choice
echo

case $choice in

     1)
     echo "======================"
     echo "PILIH MENU NO 1"
     source install/lamp_server.sh
     echo "======================"
     ;;

     2)
     echo "======================"
     echo "PILIH MENU NO 2"
                source install/web_sosmed.sh
                source install/config_sosmed.sh
     echo "======================"
     ;;

     3)
     echo "======================"
     echo "PILIH MENU NO 3"
        source install/uninstall_lamp.sh
     echo "======================"
     ;;

     0)
     echo "exit...!"
     break
     ;;

     *)

     echo "PILIHAN SALAH , PILIH NO MENU "
     ;;

esac
done






























































#matbash
#mamat08nurahmat

while true; do

clear

echo "============================="
echo "============================="
echo "0.  EXIT "
echo "1.  INSTALL LAMP-SERVER"
echo "2.  INSTALL WEB APLIKASI"
echo "3.  UNINSTALL LAMP"
echo "============================="
echo

echo -n "PILIH NO MENU: "
read choice
echo

case $choice in

     1)
     echo "======================"
     echo "PILIH MENU NO 1"
     source install/lamp_server.sh
     echo "======================"

     ;;

     2)
     echo "======================"
     echo "PILIH MENU NO 2"
                source install/web_sosmed.sh
                source install/config_sosmed.sh

     echo "======================"


     ;;

     3)
     echo "======================"
     echo "PILIH MENU NO 3"
        source install/uninstall_lamp.sh
     echo "======================"



     ;;

     0)
     echo "OK, see you!"
     break
     ;;
     *)
     echo "That is not a valid choice."
     ;;

     0)
     echo "OK, see you!"
     break
     ;;
     *)
     echo "That is not a valid choice."
     ;;


esac
done






















