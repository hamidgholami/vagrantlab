# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
# Define VMs with static private IP addresses, vcpu, memory and vagrant-box.
  boxes = [
    {
      :name => "centos7lab1",
      :box_url => "http://lanartifactory.dotin.ir/artifactory/vagrant/centos7_libvirt.box",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.11.101"
    },
    {
      :name => "centos7lab2",
      :box_url => "http://lanartifactory.dotin.ir/artifactory/vagrant/centos7_libvirt.box",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.11.102"
    },
    {
      :name => "centos7lab3",
      :box_url => "http://lanartifactory.dotin.ir/artifactory/vagrant/centos7_libvirt.box",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.11.103"
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
      #config.vm.box = opts[:box]
      config.vm.box = "centos/7"
      config.vm.box_url = opts[:box_url]
      config.vm.hostname = opts[:name]
      config.vm.provider "libvirt" do |v|
#      config.vm.provider :virtualbox do |v|
        v.memory = opts[:ram]
        v.cpus = opts[:vcpu]
      end
      
      #Synced Directories
      config.vm.synced_folder '.', '/vagrant', type: 'rsync', disabled: true
      config.vm.synced_folder './scripts', '/vagrant/provision/scripts', type: 'rsync'      
      config.vm.synced_folder './files', '/vagrant/provision/files', type: 'rsync'

      #Privision
      config.vm.provision 'shell', path: "./scripts/dotin.sh"

      config.vm.network :private_network, ip: opts[:ip],
                :libvirt__forward_mode => "route",
                :libvirt__dhcp_enabled => false
#      config.vm.provision :file do |file|
#         file.source     = './keys/vagrant'
#         file.destination    = '/tmp/vagrant'
#        end
#      config.vm.provision :file do |file|
#        file.source     = './inventory-test.yaml'
#        file.destination    = '/home/vagrant/inventory-test.yaml'
#       end
#      config.vm.provision :shell, path: "bootstrap-node.sh"
#      config.vm.provision :ansible do |ansible|
#        ansible.verbose = "v"
#        ansible.playbook = "playbook.yml"
#      end
   end
  end
end
