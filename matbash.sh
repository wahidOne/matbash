
#!/bin/bash

while :
do
    clear
    cat<<EOF
    ==============================
    MATBASH MENU
    ------------------------------
    Please enter your choice:

    (1)INSTALL DOCKER
    (2)UBUNTU UPDATE
    (3)UBUNTU UPGRADE
    (4)IP PUBLIC
    (5)CODE SERVER
    (6)SUDO REBOOT
    (7)INSTALL JENKINS
    (Q)uit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
	
    "1")  
#========MENU 1 WHILE DO===============
#======================================    
while :
do
    clear
    cat<<EOF
    ==============================
    MENU INSTALL
    ------------------------------
    Please enter your choice:


    (1)DOCKER INSTALL
    (2)DOCKER COMPOSE
    (3)DOCKER MACHINE
    (4)DOCKER USER
    (5)DOCKER LOGIN
    (6)DOCKER CEK
    (B)ack
    (Q)uit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
	
   
##================================ 
    "1")  
    echo "INSATAL DOCKER " 
#    source install/docker.sh
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# docker --version
sudo rm get-docker.sh

    ;;
##================================ 

##================================ 
    "2")  
    echo "INSATAL DOCKER COMPOSE" 

#install docker compose
sudo apt  install docker-compose -y

#cek
# docker-compose --version
    ;;
##================================ 

##================================ 
    "3")  
    echo "INSATAL DOCKER MACHINE " 

#install docker machine

base=https://github.com/docker/machine/releases/download/v0.16.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo install /tmp/docker-machine /usr/local/bin/docker-machine

#cek
# docker-machine --version
    ;;
##================================ 


##================================ 
    "4")  
    echo "DOCKER USER " 

#sudo user docker
#sudo groupadd docker
sudo usermod -aG docker $USER

#cannot-login-to-docker-account
sudo apt install gnupg2 pass -y

    ;;
##================================ 


##================================ 
    "5")  
    echo "DOCKER LOGIN " 

docker login

#set access
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
    ;;
##================================ 


##================================ 
    "6")  
    echo "DOCKER CEK " 

docker --version
docker-compose --version
docker-machine --version
    ;;
##================================ 


   
    "B"|"b")  break                 ;;
    "Q"|"q")  exit                  ;;
   
 
    * )  echo "invalid option"     ;;

    esac
    sleep 2
done

#========END MENU 1 WHILE DO===============
#==========================================    
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
    echo "======>"
	sudo chmod 777 "$HOME" -R
	docker run -d -p 1234:8443 -v "$HOME:/home/coder/project" codercom/code-server --allow-http --no-auth
    curl ifconfig.me 
    echo"port:1234"
    echo "<======="    
    ;;


    "6")  
    echo "SUDO REBOOT"
    echo "======>"
	sudo reboot
    echo "<======="    
    ;;


    "7")  

#========MENU 7 WHILE DO===============
#======================================    
while :
do
    clear
    cat<<EOF
    ==============================
    MENU INSTALL JENKINS
    ------------------------------
    Please enter your choice:


    (1)DOCKER JENKINS
    (2)PASSWORD ADMIN

    (B)ack
    (Q)uit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
	
   
##================================ 
    "1")  
    echo "DOCKER JENKINS"

# Install Jenkins on Docker

## Install Docker

# docker rm -f blueocean
docker run -d -u root -p 8080:8080 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME":/home --name blueocean jenkinsci/blueocean
    ;;
##================================ 

##================================ 
    "2")  
    echo "PASSWORD ADMIN" 

docker exec -it blueocean bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"     

    ;;
##================================ 



   
    "B"|"b")  break                 ;;
    "Q"|"q")  exit                  ;;
   
 
    * )  echo "invalid option"     ;;

    esac
    sleep 4
done

#========END MENU 1 WHILE DO===============
#==========================================

    ;;



    "q"|"Q") echo "Quit Menu" 
    exit                      ;;
   

    * )  echo "invalid option"     ;;

    esac
    sleep 4
done

