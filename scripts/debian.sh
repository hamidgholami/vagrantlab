#nmcli con mod "System eth1" ipv4.dns "8.8.8.8" 
#systemctl restart NetworkManager
#
#mkdir /etc/docker
#cat << EOF > /etc/docker/daemon.json
#{
#  "insecure-registries" : ["mycompany.registry.com"]
#}
#EOF
#
#mv /etc/apt/sources.list /etc/apt/sources.list.disabled
##for i in * ; do mv $i $i.disabled ; done 
#cp /vagrant/provision/scripts/*.list /etc/apt/sources.list.d/
#cd /vagrant/provision/scripts/apt_keys && sudo apt-key add *
#cp /vagrant/provision/scripts/certs/SSL /etc/apt/apt.conf.d/

if ! [ -a /home/vagrant/.ssh ] ; then
  mkdir /home/vagrant/.ssh

fi

if ! [ -a /root/.ssh ] ; then
  mkdir /root/.ssh

fi

