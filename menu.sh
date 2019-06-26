
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
    (4)IP PUBLIC
    (5)CODE SERVER
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
    (5)DOCKER COMPOSE
    (6)DOCKER MACHINE
    (7)DOCKER USER
    (8)DOCKER LOGIN
    (9)DOCKER CEK
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
    source uninstall_lamp.sh
##================================ 
    ;;
   
    "4")  
##================================ 
    echo "INSATAL DOCKER " 
#    source install/docker.sh
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# docker --version
sudo rm get-docker.sh

##================================ 
    ;;

    "5")  
##================================ 
    echo "INSATAL DOCKER COMPOSE" 

#install docker compose
sudo apt  install docker-compose -y

#cek
# docker-compose --version
##================================ 
    ;;

    "6")  
##================================ 
    echo "INSATAL DOCKER MACHINE " 

#install docker machine

base=https://github.com/docker/machine/releases/download/v0.16.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo install /tmp/docker-machine /usr/local/bin/docker-machine

#cek
# docker-machine --version
##================================ 
    ;;


    "7")  
##================================ 
    echo "DOCKER USER " 

#sudo user docker
#sudo groupadd docker
sudo usermod -aG docker $USER

#cannot-login-to-docker-account
sudo apt install gnupg2 pass -y

##================================ 
    ;;


    "8")  
##================================ 
    echo "DOCKER LOGIN " 

docker login


#set access
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
##================================ 
    ;;


    "9")  
##================================ 
    echo "DOCKER CEK " 

docker --version

docker-compose --version
docker-machine --version
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
   
    "4")  
    echo "IP PUBLIC"
    echo "===>"
    curl ifconfig.me 
    echo ""    
    ;;   
	
    "5")  
    echo "CODE SERVER"
    echo "===>"
	sudo chmod 777 "$HOME" -R
	docker run -d -p 1234:8443 -v "$HOME:/home/coder/project" codercom/code-server --allow-http --no-auth
    curl ifconfig.me echo":1234"
    echo "<======="    
    ;;
   
    "q"|"Q") echo "Quit Menu" 
    exit                      ;;
   

    * )  echo "invalid option"     ;;

    esac
    sleep 2
done

