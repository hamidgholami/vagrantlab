# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
# Define VMs with static private IP addresses, vcpu, memory and vagrant-box.
  boxes = [
    {
      :name => "centos7lab1",
      :box => "centos/7",
      :box_url => "http://lanartifactory.dotin.ir/artifactory/vagrant/centos7_libvirt.box",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.11.101"
    },
    {
      :name => "centos7lab2",
      :box => "centos/7",
      :box_url => "http://lanartifactory.dotin.ir/artifactory/vagrant/centos7_libvirt.box",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.11.102"
    },
    {
      :name => "centos7lab3",
      :box => "centos/7",
      :box_url => "http://lanartifactory.dotin.ir/artifactory/vagrant/centos7_libvirt.box",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.11.103"
    },
    {
      :name => "debian10",
      :box => "debian10_buster",
      :box_url => "http://lanartifactory.dotin.ir/artifactory/vagrant/debian10_buster.box",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.11.104"
    },
    {
      :name => "focal-desktop",
      :box => "focal-desktop",
      :box_url => "http://lanartifactory.dotin.ir/artifactory/vagrant/ubuntu-20.04-desktop-amd64.box",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.11.105"
    },
    {
      :name => "ubuntu2004",
      :box => "generic_ubuntu2004",
      :box_url => "http://lanartifactory.dotin.ir/artifactory/vagrant/generic_ubuntu2004.box",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.11.106"
    }
 ]

  # Provision each of the VMs.
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
#   Only Enable this if you are connecting to Proxy server
#      config.proxy.http     = "http://usernam:password@x.y:80"
#      config.proxy.https    = "http://usernam:password@x.y:80"
#      config.proxy.no_proxy = "localhost,127.0.0.1"
#      config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
      config.ssh.insert_key = false
      config.vm.box = opts[:box]
      config.vm.box_url = opts[:box_url]
      config.vm.hostname = opts[:name]
      config.vm.provider "libvirt" do |v| # or config.vm.provider :virtualbox do |v|
        v.memory = opts[:ram]
        v.cpus = opts[:vcpu]
      end
      
      #Synced Directories
      config.vm.synced_folder '.', '/vagrant', type: 'rsync', disabled: true
      config.vm.synced_folder '.', '/vagrant', disabled: true
      config.vm.synced_folder './scripts', '/vagrant/provision/scripts', type: 'rsync'
      config.vm.synced_folder './files', '/vagrant/provision/files', type: 'rsync'
     
      if opts[:box] == 'debian10_buster' # Debian 10 buster
              config.nfs.functional = false
              config.nfs.verify_installed = false
              #config.vm.provision 'shell', path: "./scripts/dotin-debian.sh"
      elsif opts[:box] == 'centos/7' # CentOS7
              config.vm.provision 'shell', path: "./scripts/dotin-redhat.sh"
      elsif opts[:box] == 'generic_ubuntu2004' # Ubuntu 20.04
              config.vm.provision 'shell', path: "./scripts/dotin-debian.sh"
      elsif opts[:box] == 'focal-desktop' # Ubuntu with desktop
              config.vm.provision 'shell', path: "./scripts/dotin-debian.sh"
      else
              break
      end
      # Network
      config.vm.network :private_network, ip: opts[:ip],
                :libvirt__forward_mode => "route",
                :libvirt__dhcp_enabled => false
   end
  end
end