#!/bin/bash

#matbash
#mamat08nurahmat

echo "============================="
echo " INSTALL KUBERNETES"
echo "============================="
curl -­LO https://storage.googleapis.com/kubernetes­-release/release/$(curl -­s https://storage.googleapis.com/kubernetes-­release/release/stable.txt)/bin/linux/amd64/kubectl

echo "=============================>"
echo "Beri Akses"
echo "=============================>"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo "=============================>"
echo "Install Kops"
echo "=============================>"
wget https://github.com/kubernetes/kops/releases/download/1.8.1/kops­-linux­-amd64
chmod +x kops­-linux-­amd64
sudo mv kops­-linux­-amd64 /usr/local/bin/kops

echo "=============================>"
echo "Expose envinronmet dari s3"
echo "=============================>"
#export KOPS_STATE_STORE=s3://clusters.dev.sdcilsy­-trainer.web.id

echo "=============================>"
echo "Setup selesai"
echo "=============================>"
echo "=============================>"

echo "=============================>"
echo "DONE"
echo "=============================>"
