
#!/bin/bash

while :
do
    clear
    cat<<EOF
    ==============================
    MATBASH MENU
    ------------------------------
    Please enter your choice:

    (1)INSTALL
    (2)UBUNTU UPDATE
    (3)UBUNTU UPGRADE
    (Q)uit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
	
    "1")  
#========MENU 1 WHILE DO===============
#=============================    
while :
do
    clear
    cat<<EOF
    ==============================
    MENU INSTALL
    ------------------------------
    Please enter your choice:

    (1)LAMP 
    (2)CONFIG SOSMED WEB
    (3)UNINSTALL LAMP
    (4)DOCKER
    (B)ack
    (Q)uit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
	
    "1")  
##================================ 
    echo "1.INSATAL LAMP_SERVER " 
     source install/lamp_server.sh
##================================     
    ;;


    "2")  
##================================ 
    echo "CONFIG SOSMED WEB " 
    source install/web_sosmed.sh
    source install/config_sosmed.sh
##================================ 
    ;;
   
    "3")  
##================================ 
    echo "UNINSATAL LAMP " 
    source install/docker.sh
##================================ 
    ;;
   
    "4")  
##================================ 
    echo "INSATAL DOCKER " 
    source uninstall_lamp.sh
##================================ 
    ;;
   
    "B"|"b")  break                 ;;
    "Q"|"q")  exit                  ;;
   
 
    * )  echo "invalid option"     ;;

    esac
    sleep 2
done


#=============================    
    
    
     ;;
   
    "2")  
    echo "UPDATE UBUNTU"
    sudo apt-get update 
    ;;
   
    "3")  
    echo "UBUNTU UPGRADE"
    sudo apt-get upgrade 
    ;;
   
    "q"|"Q") echo "Quit Menu" 
    exit                      ;;
   

    * )  echo "invalid option"     ;;

    esac
    sleep 2
done
