# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/precise32"
  config.vm.provision "shell", path: "bootstrap.sh"

  config.vm.network "public_network"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "forwarded_port", host: 8181, guest: 80

  config.vm.synced_folder "./", "/var/www", id: "vagrant-www",
    owner: "vagrant",
    group: "www-data",
    mount_options: ["dmode=775,fmode=664"]
end