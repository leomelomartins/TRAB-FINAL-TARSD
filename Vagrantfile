# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.define "containerMaster" do |containerMaster|

 	containerMaster.vm.box = "ubuntu/bionic64"
 	containerMaster.vm.network "forwarded_port", guest: 9000, host: 9002

      containerMaster.vm.network "private_network", ip: "192.168.50.2"
	containerMaster.vm.hostname = "server"
      containerMaster.vm.provider "virtualbox" do |vb|
  	         vb.memory = "4096"
   	         vb.name = "containerMaster"
      end

  containerMaster.vm.provision :shell, path: "./master-config.sh"
  end

config.vm.define "containerWorker" do |containerWorker|

 	containerWorker.vm.box = "ubuntu/bionic64"
      containerWorker.vm.network "private_network", ip: "192.168.50.3"
	containerWorker.vm.hostname = "containerWorker"
      containerWorker.vm.provider "virtualbox" do |vb|
  	vb.memory = "2048"
   	vb.name = "containerWorker"
  end

  containerWorker.vm.provision :shell, path: "./worker-config.sh"
  end
end
