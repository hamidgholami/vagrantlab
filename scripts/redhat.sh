
#nmcli con mod "System eth1" ipv4.dns "8.8.8.8" 
#systemctl restart NetworkManager
#
#mkdir /etc/docker
#cat << EOF > /etc/docker/daemon.json
#{
#  "insecure-registries" : ["mycompany.registry.com"]
#}
#EOF

#cd /etc/yum.repos.d/
#for i in * ; do mv $i $i.disabled ; done 
#cp /vagrant/provision/scripts/ ./

if ! [ -a /home/vagrant/.ssh ] ; then
  mkdir /home/vagrant/.ssh

fi

if ! [ -a /root/.ssh ] ; then
  mkdir /root/.ssh

fi

