#!/bin/bash

#DOCKERSWARM
sudo docker swarm init --advertise-addr 192.168.50.2:2377 | sed 5!d > /vagrant/token.sh
#Criação da rede
sudo docker network create -d overlay --subnet 10.0.10.0/24 ClusterNet
#Criação do serviço
sudo docker service create -d --name webservice01 --network ClusterNet --replicas 3 -p 5001:80 server

cd TRAB-FINAL-TARSD/Master

#PROMETHEUS
#Criar a nova imagem prometheus usando o Dockerfile e iniciar o container Prometheus
sudo docker build -t my-prometheus .
sudo docker run -p 9090:9090 --restart=always --detach=true --name=prometheus my-prometheus
#iniciar os containers contendo os exporters: node-exporter e cadvisor.
sudo docker run -d --restart=always --net="host" --pid="host" --publish=9100:9100 --detach=true --name=node-exporter -v "/:/host:ro,rslave" quay.io/prometheus/node-exporter --path.rootfs /host
sudo docker run --restart=always --volume=/:/rootfs:ro --volume=/var/run:/var/run:ro --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --volume=/dev/disk/:/dev/disk:ro --publish=8080:8080 --detach=true --name=cadvisor google/cadvisor:latest

#Metricas do container p/ DB
cd ../container_metrics
sudo docker volume create db-container
sudo docker service create -d --name service-container -p 8087:8086 --mount source=db-container,target=/var/lib/influxdb --network ClusterNet influxdb
sleep 20; curl -X POST -G http://localhost:8087/query --data-urlencode "q=CREATE DATABASE prometheus"

#Metricas das VMs p/ DB
cd ../vm_metrics
sudo docker volume create db-vm
sudo docker service create -d --name service-vm -p 8086:8086 --mount source=db-vm,target=/var/lib/influxdb --network ClusterNet influxdb
sleep 20; curl -X POST -G http://localhost:8086/query --data-urlencode "q=CREATE DATABASE prometheus"

#GRAFANA
sudo docker run -d --name=grafana --restart=always -p 3000:3000 grafana/grafana
