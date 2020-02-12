# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  #config.vm.box = "base"
  config.vm.define "origen" do |origen|
    #origen.vm.box_version = "1905.1"
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
  #  origen.vm.memory = "1024"
    origen.vm.provision "shell", inline: <<-SHELL
    sudo chmod a+x /provision/provision.sh
    sudo /bin/bash /provision/provision.sh blue_gw
   SHELL

  end

  config.vm.define "destino" do |destino|
    #destino.vm.box = "centos/8"
    destino.vm.box = "geerlingguy/centos8"
    #destino.vm.box_version = "1905.1"
    destino.vm.define "destino"
    destino.vm.hostname = "destino"
    destino.vm.network "forwarded_port", guest: 8080, host: 8082
    destino.vm.network "private_network", ip: "10.0.0.3"
    destino.vm.network "public_network", type: "dhcp", bridge: "enp0s3"
  #  destino.vm.memory = "2048"
    destino.vm.provider :virtualbox do |vb|
            vb.name = "destino"
    end
    destino.vm.synced_folder "provision", "/provision"
  #  origen.vm.memory = "1024"
    destino.vm.provision "shell", inline: <<-SHELL
    sudo chmod a+x /provision/provision.sh
    sudo /bin/bash /provision/provision.sh red_gw
   SHELL

  end
 

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
