
nmcli con mod "System eth1" ipv4.dns "10.100.1.181" 
systemctl restart NetworkManager

mkdir /etc/docker
cat << EOF > /etc/docker/daemon.json
{
  "insecure-registries" : ["lanartifactory.dotin.ir:80"]
}
EOF

mv /etc/apt/sources.list /etc/apt/sources.list.disabled
#for i in * ; do mv $i $i.disabled ; done 
cp /vagrant/provision/scripts/*.list /etc/apt/sources.list.d/
cd /vagrant/provision/scripts/apt_keys && sudo apt-key add *
cp /vagrant/provision/scripts/dotin-certs/SSL /etc/apt/apt.conf.d/

if ! [ -a /home/vagrant/.ssh ] ; then
  mkdir /home/vagrant/.ssh

fi

if ! [ -a /root/.ssh ] ; then
  mkdir /root/.ssh

fi

