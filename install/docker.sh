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


        #Uninstall old versions
        sudo apt-get remove docker docker-engine docker.io containerd runc

#Install Docker CE
        #-Install using the repository
     
        #SET UP THE REPOSITORY
        #1.Update the apt package index:
        sudo apt-get update;

        #2.Install packages to allow apt to use a repository over HTTPS:
        sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

        #3.Add Docker’s official GPG key:
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

        #Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint.
        sudo apt-key fingerprint 0EBFCD88

        #4.Use the following command to set up the stable repository
        sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"


#INSTALL DOCKER CE
        #1.Update the apt package index
        sudo apt-get update


        #2.Install the latest version of Docker CE and containerd, or go to the next step to install a specific version:
        sudo apt-get install docker-ce docker-ce-cli containerd.io        




        clear;





     echo "======================"
     echo "INSTALL DOCKER DONE...!!!!"
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

