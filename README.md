# Vagrant Lab
This is a sample of Vagrantfile for prepare a suitable labratory with `vagrant` on `Ubuntu 20.04`.
***
## Vagrant boxes
These vagrant boxes exist in this Vagrantfile.

- CentOS 7
- Ubuntu 20.04 server
- Debian 10 buster
- Ubuntu 20.04 with desktop (GUI)
***
## Requierments

#### Install KVM qemu libvirt

[Official Ubuntu KVM installation](https://help.ubuntu.com/community/KVM/Installation)

Before continuing with the installation, make sure your Ubuntu host machine supports KVM virtualization. The system should have either an Intel processor with the VT-x (vmx), or an AMD processor with the AMD-V (svm) technology support.

Run the following grep command to verify that your processor supports hardware virtualization:
```sh
grep -Eoc '(vmx|svm)' /proc/cpuinfo
```
If the CPU supports hardware virtualization, the command will output a number greater than zero, which is the number of the CPU cores. Otherwise, if the output is 0 it means that the CPU doesn’t support hardware virtualization.

On some machines, the virtual technology extensions may be disabled in the BIOS by the manufacturers.

- To check if VT is enabled in the BIOS, use the kvm-ok tool.

```sh
kvm-ok
```
```ini
output

INFO: /dev/kvm exists
KVM acceleration can be used
```
- Install packages

```sh
sudo apt install qemu libvirt-daemon-system \
libvirt-clients libxslt1-dev libxml2-dev libvirt-dev \
zlib1g-dev ruby-dev ruby-libvirt ebtables dnsmasq-base \
qemu-kvm bridge-utils virtinst virt-manager libvirt-doc \
qemu-kvm virtinst virt-viewer virt-manager bridge-utils \
cpu-checker virt-top imvirt
```
- Start and enable libvirtd daemon service.

```sh
sudo systemctl is-active libvirtd
```
- To be able to create and manage virtual machines, you’ll need to add your user to the “libvirt” and “kvm” groups. To do that, enter:

```sh
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER
```
#### Install Vagrant
Download deb/rpm package from [vagrant official website](https://www.vagrantup.com/downloads).
- Install vagrant package.

```sh
sudo dpkg -i vagrant_2.2.13_i686.deb
# or
sudo apt install ./vagrant_2.2.13_i686.deb
```
- Now, install **vagrant-libvirt** plugin using command:

```sh
vagrant plugin install vagrant-libvirt
```
- You also need to install **vagrant-mutate** plugin which converts vagrant boxes to work with different providers.

```sh
vagrant plugin install vagrant-mutate
```
***
## How does it work?
These are boxes defined name in this `Vagrantfile`:
- centos7lab1
- centos7lab2
- centos7lab3
- debian10
- focal-desktop
- ubuntu2004

Finally:
```bash
vagrant up <boxes defined name>
# e.g vagrant up debian10
```
***
**Author**: Hamid Gholami (hidgholami@gmail.com)

[![Linkedin](https://i.stack.imgur.com/gVE0j.png) LinkedIn](https://www.linkedin.com/in/hamid-gholami)
&nbsp;
[![GitHub](https://i.stack.imgur.com/tskMh.png) GitHub](https://github.com/hamidgholami)
&nbsp;
[![Twitter](http://i.imgur.com/wWzX9uB.png) Twitter](https://www.twitter.com/045_hamid)
