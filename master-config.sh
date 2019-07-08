#!/bin/bash

git clone https://github.com/leomelomartins/TRAB-FINAL-TARSD.git

DEBIAN_FRONTEND=noninteractive sudo apt update

#Instalacao do Docker
sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
DEBIAN_FRONTEND=noninteractive sudo apt update
DEBIAN_FRONTEND=noninteractive sudo apt -y install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker

#Iniciando o Docker Swarm Master
#Entrada do programa na instalação da imagem do docker do cliente
cd TRAB-FINAL-TARSD/

#Inicializa e joga o token gerado em um script externo
sudo docker swarm init --advertise-addr 192.168.50.2:2377 | sed 5!d > /vagrant/join.sh

#Criação da rede para o cluster
sudo docker network create -d overlay --subnet 10.0.10.0/24 ClusterNet



#PROMETHEUS
# sudo docker build -t my-prometheus .
# sudo docker run -p 9090:9090 --restart=always --detach=true --name=prometheus my-prometheus
# sudo docker run -d --restart=always --net="host" --pid="host" --publish=9100:9100 --detach=true --name=node-exporter -v "/:/host:ro,rslave" quay.io/prometheus/node-exporter --path.rootfs /host
# sudo docker run --restart=always --volume=/:/rootfs:ro --volume=/var/run:/var/run:ro --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --volume=/dev/disk/:/dev/disk:ro --publish=8080:8080 --detach=true --name=cadvisor google/cadvisor:latest

#AINDA PRECISA CONFIGURAR AS APP AQUI
