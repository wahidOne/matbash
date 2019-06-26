#!/bin/sh

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

#cek
#docker --version

#install docker compose
sudo apt  install docker-compose -y

#cek
#docker-compose --version


#install docker machine

base=https://github.com/docker/machine/releases/download/v0.16.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo install /tmp/docker-machine /usr/local/bin/docker-machine

#cek
#docker-machine --version


#sudo user docker
#sudo groupadd docker
sudo usermod -aG docker $USER

##!!!!!
#sudo reboot
##=================================================
#cannot-login-to-docker-account
#sudo apt install gnupg2 pass

#docker login


#set access
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
