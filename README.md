# Centos7_dev

#### Vagrant Deployment Script

### Requirements:
- Vagrant running over VirtualBox on Mac or Linux
- Ansible > 2.1.1


### Usage:
- Clone this repository in a local folder.
- Run vagrant up and wait for it.

### Credentails and Access
- Default database credentails are located at ansible/roles/mysql57_docker/vars/main.yml.
- The default IP is 192.168.99.100, configured in the Vagrantfile.
- Phpmyadmin will be running at port 9090.

### How it works?
Vagrant will create a new Vbox VM using the Vagrantfile as starting point. 
After that, two different provisioners are being executed. 

First, the shell Vagrant provisioner will install the EPEL repo and from it, Ansible as the main configuration tool.

The Ansible roles are listed in the ansible/main.yml. From that file, different roles will be applied in a 
certain order, to ensure everything is installed in the correct way.

- **docker_host** : 
This role installs what's needed to run Docker inside the VM.

- **mysql57_docker**: 
This role installs and configure MySQL 57 as a Docker container.

- **phpmyadmin_docker**: 
This role installs and configure PHPMyAdmin as a Docker container.

- **php7_apache24**: 
This role installs PHP7 and Apache 2.4 in the VM.

- **docker_vagrant**: 
This role applies a little hack to avoid race-condition issues between Docker networking and Vagrant network config jobs.

- **mysql57_docker**: 
This is an alternative role (not being used by default) that installs and configure MySQL 57 directly on the VM, 
not using Docker.