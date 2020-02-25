# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "origen" do |origen|
    origen.vm.box = "geerlingguy/centos8"
    origen.vm.define "origen"
    origen.vm.hostname = "origen"
    origen.vm.network "forwarded_port", guest: 8080, host: 8081
    origen.vm.network "private_network", ip: "10.0.0.2"
    origen.vm.network "public_network", type: "dhcp", bridge: "enp0s3"
    origen.vm.provider :virtualbox do |vb|
            vb.name = "origen"
    end
    origen.vm.synced_folder "provision", "/provision"
    origen.vm.provision "shell" do |s|
            s.inline = "sudo chmod a+x /provision/provision.sh && sudo /bin/bash /provision/provision.sh blue_gw"
            s.binary = true
    end 
  end

  config.vm.define "destino" do |destino|
    destino.vm.box = "geerlingguy/centos8"
    destino.vm.define "destino"
    destino.vm.hostname = "destino"
    destino.vm.network "forwarded_port", guest: 8080, host: 8082
    destino.vm.network "private_network", ip: "10.0.0.3"
    destino.vm.network "public_network", type: "dhcp", bridge: "enp0s3"
    destino.vm.provider :virtualbox do |vb|
            vb.name = "destino"
    end
    destino.vm.synced_folder "provision", "/provision"
    destino.vm.provision "shell" do |s|
            s.inline = "sudo chmod a+x /provision/provision.sh && sudo /bin/bash /provision/provision.sh red_gw"
            s.binary = true
    end 
  end
end
