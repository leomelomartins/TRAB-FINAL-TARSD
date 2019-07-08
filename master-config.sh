#!/bin/bash

#INICIANDO DOCKER
cd TRAB-FINAL-TARSD/
sudo docker swarm init --advertise-addr 192.168.50.2:2377 | sed 5!d > /vagrant/token.sh
sudo docker network create -d overlay --subnet 10.0.10.0/24 ClusterNet

#PROMETHEUS
sudo docker build -t my-prometheus .
sudo docker run -p 9091:9091 --restart=always --detach=true --name=prometheus my-prometheus
sudo docker run -d --restart=always --net="host" --pid="host" --publish=9100:9100 --detach=true --name=node-exporter -v "/:/host:ro,rslave" quay.io/prometheus/node-exporter --path.rootfs /host
sudo docker run --restart=always --volume=/:/rootfs:ro --volume=/var/run:/var/run:ro --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --volume=/dev/disk/:/dev/disk:ro --publish=8080:8080 --detach=true --name=cadvisor google/cadvisor:latest

#AINDA PRECISA CONFIGURAR AS APP AQUI
