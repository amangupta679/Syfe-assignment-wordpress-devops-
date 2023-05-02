                                                                                                       Infra Intern Syfe -2022

#1 - Run a Production grade Wordpress app on Kubernetes
Objectives:
* Create PersistentVolumeClaims and PersistentVolumes
   ReadWriteMany volumes for deployment scaling
* Create DockerFile for Wordpress, Mysql and Nginx. All the request will proxy pass from nginx to wordpress. 
   We using lua in Nginx, so compile a opensresty with lua while building docker container image for Nginx. 
   Use below configure option in opensresty build
   
1 ./configure --prefix=/opt/openresty \
2             --with-pcre-jit \
3             --with-ipv6 \
4             --without-http_redis2_module \
5             --with-http_iconv_module \
6             --with-http_postgres_module \
7             -j8

* Apply should be using Helm chart like helm install my-release my-repo/wordpress 
* Clean up helm delete my-release

Step 1: setting up kubernetes (minikube ) om local ubantu machine - vertual box 
   *  sudo apt-get update
   *  sudo apt-get install docker.io
   
   Go to minikube website  ---- https://minikube.sigs.k8s.io/docs/start/
   Select your configuration 
   My configuration 
   1 . Operating system -----  Linux 
   2 . Architecture ----- x86-64 
   3 . Release type ---- Stable 
   4 . Installer type --- Binary Download 
   To install the latest minikube stable release on x86-64 Linux using binary download:
   
   copy the command -- curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
                       sudo install minikube-linux-amd64 /usr/local/bin/minikube
                       
   * minikube start
   will not start do type the below command and firsr give docker usergrp permission 
   * sudo usermod -aG docker $USER
   * minikube start --driver=docker 
   
   Install kubectl 
   * sudo snap install kubectl 
   now check for running container 
   * docker ps 
   Now minikube is up and running 
   
Step 2 : Creating a namespace 
   Can use a default namespace as well 
   
   * kubectl create namespace wordpress
   
Step 3 . creating a deployment file with three containers in it Wordpress  , Mysql  , Nginx  
   * vim deployment.yaml ( check from he files section )
   
   Now lets execute it 
   * kubectl apply -f deployment.yaml 
   Now check all the pods are running or not 
   * kubectl get pods  // for ( default namespace ) 
   
   
   
   
