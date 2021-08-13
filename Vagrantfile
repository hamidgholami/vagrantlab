# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
# Define VMs with static private IP addresses, vcpu, memory and vagrant-box.
  boxes = [
    {
      :name => "centos7lab1",
      :box => "centos/7",
      #:box_url => "http://mycompany.registry.com/artifactory/vagrant/centos7_libvirt.box",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.56.101"
    },
    {
      :name => "centos7lab2",
      :box => "centos/7",
      #:box_url => "http://mycompany.registry.com/artifactory/vagrant/centos7_libvirt.box",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.56.102"
    },
    {
      :name => "centos7lab3",
      :box => "centos/7",
      #:box_url => "http://mycompany.registry.com/artifactory/vagrant/centos7_libvirt.box",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.56.103"
    },
    {
      :name => "debian10",
      :box => "debian/buster64",
      #:box_url => "http://mycompany.registry.com/artifactory/vagrant/debian10_buster.box",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.56.104"
    },
    {
      :name => "focal-desktop",
      :box => "peru/ubuntu-20.04-desktop-amd64",
      #:box_url => "http://mycompany.registry.com/artifactory/vagrant/ubuntu-20.04-desktop-amd64.box",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.56.105"
    },
    {
      :name => "ubuntu2004",
      :box => "generic/ubuntu2004",
      #:box_url => "http://mycompany.registry.com/artifactory/vagrant/generic_ubuntu2004.box",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.56.106"
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
#      config.vm.box_url = opts[:box_url]
      config.vm.hostname = opts[:name]
      config.vm.provider "virtualbox" do |v| # or config.vm.provider :virtualbox do |v|
        # v.storage :file, :size => '5G'
        # v.storage :file, :size => '5G'
        # v.storage :file, :size => '5G'
        v.memory = opts[:ram]
        v.cpus = opts[:vcpu]
      end
      
      #Synced Directories
      config.vm.synced_folder '.', '/vagrant', type: 'rsync', disabled: true
      config.vm.synced_folder '.', '/vagrant', disabled: true
      config.vm.synced_folder './scripts', '/vagrant/provision/scripts', type: 'rsync'
      config.vm.synced_folder './files', '/vagrant/provision/files', type: 'rsync'
     
      if opts[:box] == 'debian/buster64' # Debian 10 buster
              config.nfs.functional = false
              config.nfs.verify_installed = false
              #config.vm.provision 'shell', path: "./scripts/debian.sh"
      elsif opts[:box] == 'centos/7' # CentOS7
              config.vm.provision 'shell', path: "./scripts/redhat.sh"
      elsif opts[:box] == 'generic/ubuntu2004' # Ubuntu 20.04
              config.vm.provision 'shell', path: "./scripts/debian.sh"
      elsif opts[:box] == 'peru/ubuntu-20.04-desktop-amd64' # Ubuntu with desktop
              config.vm.provision 'shell', path: "./scripts/debian.sh"
      else
              break
      end
      # Network
      config.vm.network :private_network, ip: opts[:ip]
                # :libvirt__forward_mode => "route",
                # :libvirt__dhcp_enabled => false
   end
  end
end
