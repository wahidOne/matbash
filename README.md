::ssh -i C:\Users\mamat\Desktop\DEVOPS\CILSY\KEY\MAMAT.pem ubuntu@54.214.201.41

::#STEP_1
::Siapkan DNS
::#Route53 --> kube.sdcilsy-charlie.web.id
::#cek dns 
::ping kube.sdcilsy-charlie.web.id
::dig NS kube.sdcilsy-charlie.web.id

::#STEP_2
::#Installasi AWS CLI
sudo apt-get update
sudo apt-get install awscli
aws configure

::aws configure
::Acces Key-->XXXXXXXXXX
::Secret Key -->YYYYYYY
::region name --> us-west-2
::output format -->json

::#buat s3 via awscli
::--> aws s3 mb s3://clusters.kube.xxxx.com
aws s3 mb s3://clusters.kube.sdcilsy-charlie.web.id
::cek --> aws s3 ls

::#Expose environment variable dari s3:
::export KOPS_STATE_STORE=s3://nama_clusters_s3
export KOPS_STATE_STORE=s3://clusters.kube.sdcilsy-charlie.web.id
::cek --> echo KOPS_STATE_STORE

::#STEP_3
::#INSTALL KUBECTL DAN KOPS
#Install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

#Install kops
wget https://github.com/kubernetes/kops/releases/download/1.8.1/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops

::#STEP_4
::#Clustering Kubernetes	
::???::--> kops --help

# Create a cluster in AWS
  kops create cluster --name=kubernetes.sdcilsy-charlie.web.id \
  --zones=us-west-2b \
  --node-count=4 --node-size=t2.micro --master-size=t2.micro \
  --dns-zone=sdcilsy-charlie.web.id \
  --state=s3://clusters.kube.sdcilsy-charlie.web.id  ##OPTIONAL



#CEK List clusters  
kops get cluster
#Update Cluster
kops update cluster kubernetes.sdcilsy-charlie.web.id --yes
#Validate Cluster
kops validate cluster

#show nodes	
kubectl get nodes --server-print=false


#!!! jika error
ssh-keygen -t rsa

::#STEP_5
::# pointing ip public master kubernetes ke server yang kitagunakan
sudo nano /etc/hosts

::----------------------------------------------------------------
127.0.0.1 localhost
#ip master cluster api.kubernetes.xxx.com 
52.43.13.174 api.kubernetes.sdcilsy-charlie.web.id

# The following lines are desirable for IPv6 capable hosts
::1 ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts
::----------------------------------------------------------------


::#STEP_6
::#Kubernetes UI Dashboard
kubectl create -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/kubernetes-dashboard/v1.8.3.yaml


::login --> https://ip_master_cluster
::#!!untuk melihat username dan password halaman dashboard
kubectl config view




::#STEP_7
::#Konfigurasi Kubernetes 
wget https://k8s.io/docs/tasks/run-application/deployment.yaml

kubectl create -f deployment.yaml

::jalankan jika ada yg diedit
kubectl apply -f deployment.yaml


wget https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/service/networking/run-my-nginx.yaml
wget https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/service/networking/nginx-svc.yaml





#Then you can use the kubctl proxy to access the UI from your machine:
kubectl proxy --port=8080 &	
#The UI should now be available at http://localhost:8080

#Create an nginx deployment:
 kubectl run sample-nginx --image=nginx --replicas=2 --port=8081

 #cek 
kubectl get nodes --server-print=false 
 kubectl get pods --server-print=false 
 kubectl get deployments --server-print=false
 
 #ELB
 kubectl expose deployment sample-nginx --port=80 --type=LoadBalancer
 kubectl get services -o wide --server-print=false






###NOTE
#-------------
#List clusters with: 
	#kops get cluster
#Edit this cluster with: 
	#kops edit cluster useast1.k8s.appychip.vpc
#Edit your node instance group: 
	#kops edit ig --name=useast1.k8s.appychip.vpc nodes
#Edit your master instance group: 
	#kops edit ig --name=useast1.k8s.appychip.vpc master-us-east-1d
#Delete Cluster 
kops delete cluster --name <name> --yes














kops create cluster --cloud=aws --zones=us-west-2a kubernetes.dev.sdcilsy-charlie.web.id
#simple config
ok	#--> kops create cluster --cloud=aws --zones=us-west-2b --name=uswest1.k8s.mamat.vpc --dns-zone=mamat.vpc --dns private



#ok--> kops create cluster --cloud=aws --zones=us-west-2b uswest1.k8s.mamat.vpc

#NOTE jika error
ssh-keygen -t rsa
