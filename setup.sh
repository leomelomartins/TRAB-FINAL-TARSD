#!/bin/bash

#atualizar sistema
sudo apt update

#instala o docker nas duas VMs
sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt -y install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
#sudo systemctl enable docker

git clone https://github.com/leomelomartins/Projeto-Vagrant-DockerSwarm
#testado
