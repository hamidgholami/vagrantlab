
nmcli con mod "System eth1" ipv4.dns "10.100.1.181" 
systemctl restart NetworkManager

mkdir /etc/docker
cat << EOF > /etc/docker/daemon.json
{
  "insecure-registries" : ["lanartifactory.dotin.ir:80"]
}
EOF

cd /etc/yum.repos.d/
for i in * ; do mv $i $i.disabled ; done 
cp /vagrant/provision/scripts/lanArtifactory.repo ./

if ! [ -a /home/vagrant/.ssh ] ; then
  mkdir /home/vagrant/.ssh

fi

if ! [ -a /root/.ssh ] ; then
  mkdir /root/.ssh

fi

