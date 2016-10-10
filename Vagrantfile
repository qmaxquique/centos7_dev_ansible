# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.ssh.insert_key = false
  config.vm.hostname = "lamp"
  config.vm.network :private_network, ip: "192.168.99.100"
  config.vm.synced_folder "shared", "/local", type: "nfs", map_uid: 501, map_gid: 503

  config.ssh.forward_agent = true
  config.vm.define :lamp do |lamp|

  config.vm.provider :virtualbox do |v|
    v.name = "lamp"
    v.memory = 300
    v.cpus = 4
    #v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    #v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  end

  config.vm.provision "shell", inline: <<-SHELL
        yum -y install epel-release
        yum -y install ansible
  SHELL

  config.vm.provision "ansible" do |ansible|
       ansible.playbook = "ansible/main.yml"
       ansible.inventory_path = "ansible/inventory"
       ansible.sudo = true
       ansible.verbose = false
     end
end
