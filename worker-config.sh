#!/bin/bash

git clone https://github.com/leomelomartins/TRAB-FINAL-TARSD.git


sudo apt update
sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt -y install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker


#Entrada do programa na instalação da imagem do docker do cliente
cd Trabalho01-TARSD/

#Adiciona a permissão de execução do token
sudo chmod +x /vagrant/join.sh

#Adiciona o worker (cliente) no Cluster
bash /vagrant/join.sh
