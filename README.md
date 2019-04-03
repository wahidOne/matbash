ssh -i C:\Users\mamat\Desktop\DEVOPS\CILSY\KEY\MAMAT.pem ubuntu@34.219.212.156

#::Siapkan DNS PUBLIC (optional)
#Route53 --> sdcilsy-charlie.web.id 
#cek dns 
ping sdcilsy-charlie.web.id 
dig NS sdcilsy-charlie.web.id

#STEP_1 #Installasi AWS CLI 
sudo apt-get update 
sudo apt-get install awscli --yes 

!!!aws configure 
aws configure set aws_access_key_id XXXXXXXXXXXXXXXXX
aws configure set aws_secret_access_key YYYYYYYYYYYYYYYYYYY
aws configure set default.region us-west-2
aws configure set default.output_format json
#cek
cat ~/.aws/credentials
cat ~/.aws/config

#STEP_2 #BUAT CLUSTER di S3 
#make butcket s3 via awscli  
aws s3 mb s3://s3-003.sdcilsy-charlie.web.id 
cek --> aws s3 ls
**remove_butcket --> aws s3 rb s3://bucket-name --force  
**empety butcket --> aws s3 rm s3://bucket-name/doc --recursive

::#STEP_3 ::#INSTALL KUBECTL DAN KOPS 
#Install kubectl 
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl 
chmod +x ./kubectl 
sudo mv ./kubectl /usr/local/bin/kubectl

#Install kops 
wget https://github.com/kubernetes/kops/releases/download/1.8.1/kops-linux-amd64 
chmod +x kops-linux-amd64 
sudo mv kops-linux-amd64 /usr/local/bin/kops


#!!!NOTE  --> ssh-keygen -t rsa


#STEP_4 ::#Clustering Kubernetes ::???::--> kops create cluster--help
 **updated these two vars in .bashrc & .profile in ~ dir.
 
  export KOPS_STATE_STORE="s3://s3-003.sdcilsy-charlie.web.id"
  export KOPS_CLUSTER_NAME=k8s.sdcilsy-charlie.web.id  
  export NODE_SIZE=${NODE_SIZE:-t2.medium}
  export MASTER_SIZE=${MASTER_SIZE:-t2.medium}
  export ZONES=${ZONES:-"us-west-2a"}
  
  kops create cluster  \
  --node-count 4 \
  --zones $ZONES \
  --node-size $NODE_SIZE \
  --master-size $MASTER_SIZE \
  --master-zones $ZONES \
  --cloud=aws \
  --dns-zone=sdcilsy-charlie.web.id \
  --name=${KOPS_CLUSTER_NAME} \
  --yes

**kops delete cluster --name k8s.sdcilsy-charlie.web.id --yes

#pointing ip public master kubernetes ke server yang kitagunakan 
sudo nano /etc/hosts
ip_master_cluster api.nama_cluster
54.202.143.245 api.k8s.sdcilsy-charlie.web.id

Suggestions:
 * validate cluster: kops validate cluster
 * list nodes: kubectl get nodes --show-labels
 * ssh to the master: ssh -i ~/.ssh/id_rsa admin@api.k8s.sdcilsy-charlie.web.id
(optional)
kops edit cluster --name ${KOPS_CLUSTER_NAME}
kops update cluster --name ${KOPS_CLUSTER_NAME} --yes
kubectl get nodes --server-print=false
kubectl get pods --server-print=false


#STEP_5 #Kubernetes UI Dashboard kubectl 
kubectl create -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/kubernetes-dashboard/v1.8.3.yaml

**kubectl delete -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/kubernetes-dashboard/v1.8.3.yaml

::login --> https://ip_master_cluster ::#!!untuk melihat username dan password halaman dashboard 
kubectl config view

**kops get secrets kube --type secret -oplaintext 
**grep password: ~/.kube/config 
SXo12vLceoUgcF78rMJGDxPiVLf4zkqj
**ip_master:52.13.36.28

https://api.k8s.sdcilsy-charlie.web.id

user admin
password :3NvzOsonJ04CWgbAOL5wmBKpbI1pArrW

https://api.k8s.sdcilsy-charlie.web.id/ui


!!!downgrade v1.8.7 jika kubectl error +**--server-print=false  
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.8.7/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

#cek 
kubectl get nodes  
kubectl get pods 
kubectl get deployments 
kubectl get services -o wide 

//=========================================================
//NGINX LOAD BALANCHER CLI=========================================================
#Create an nginx deployment: 
kubectl run sample-nginx --image=nginx --replicas=2 --port=8081
#EXPOSE ELB **kubectl expose deployment NAMA_SERVICE --port=80 --type=LoadBalancer 
kubectl expose deployment sample-nginx --port=80 --type=LoadBalancer 
**cek-->kubectl get services -o wide 
**waiting ready
** cek ready ---> curl external-ip
//=========================================================


::#STEP_7 ::
#Konfigurasi 
wget https://k8s.io/docs/tasks/run-application/deployment.yaml
kubectl create -f deployment.yaml
#EXPOSE ELB **kubectl expose deployment NAMA_SERVICE --port=80 --type=LoadBalancer 
kubectl expose deployment nginx-deployment --port=80 --type=LoadBalancer 

::jalankan jika ada yg diedit 
kubectl apply -f deployment.yaml
wget https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/service/networking/run-my-nginx.yaml wget https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/service/networking/nginx-svc.yaml

//=========================


