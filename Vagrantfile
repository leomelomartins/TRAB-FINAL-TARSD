# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.define "containerMaster" do |containerMaster|

 	containerMaster.vm.box = "ubuntu/bionic64"
 	containerMaster.vm.network "forwarded_port", guest: 9000, host: 9005
    containerMaster.vm.network "private_network", ip: "192.168.50.2"
	containerMaster.vm.hostname = "containerMaster"

    containerMaster.vm.provider "virtualbox" do |vb|
         vb.memory = "4096"
         vb.name = "containerMaster"
    end

  end

config.vm.define "containerWorker" do |containerWorker|

 	containerWorker.vm.box = "ubuntu/bionic64"
    containerWorker.vm.network "private_network", ip: "192.168.50.3"
	containerWorker.vm.hostname = "containerWorker"

    containerWorker.vm.provider "virtualbox" do |vb|
  	    vb.memory = "2048"
   	    vb.name = "containerWorker"
    end

  end

    config.vm.provision "shell", inline: <<-SHELL
         echo "Installing Docker"
      	 sudo apt update
	     sudo apt upgrade
	     sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
	     curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	     sudo apt-key fingerprint 0EBFCD88
	     sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	     sudo apt update
	     sudo apt -y install docker-ce docker-ce-cli containerd.io
	     sudo usermod -aG docker $USER
	     sudo systemctl start docker
           git clone https://github.com/leomelomartins/TRAB-FINAL-TARSD
     SHELL

end
