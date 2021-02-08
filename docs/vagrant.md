# Vagrant

Vagrant is an open-source software to automate the provision of virtual machine. For this playground, it is used to rapidly setup a Ubuntu guest system within VirtualBox.

## Commands

This sections covers the most important commands to use `vagrant` for more information
use `vagrant --help` or `man vagrant`

``` bash
# starts and provisions the vagrant environment
vagrant up

# stops the vagrant environment
vagrant halt

# login via ssh
vagrant ssh

# provisions to a running vagrant machine; useful by a change of the ansible scripts
vagrant provision

# stops and deletes the vagrant machine
vagrant destroy
```

## Ansible

Vagrant offers integration for various code as infrastructure tools, among other for *Ansible*.
In order to avoid a *Ansible* installation on the host system, the Vagrant *ansible_local* provisioner is used.
Before executing the Ansible playbook, Vagrant installs *Ansible* on the guest system. As no *Ansible* installation is
required on the host system, a the portability is improved, due to a reduction of dependencies.

### Ansible Provisioning

* The ansible project is in the folder ***kubernetes-setup**
* Vagrant use the Playbook in the **master-playbook.yml** file
* The role **defaultSetup**, installs some useful linux packages like htop or mc
* The role **microK8s**, installation of Kubernetes itself
* The role **k8sDefaultAddons**, enabling the microK8 addons DNS, Ingress and Storage by default. This should reduce
    re-occurring and error prone configuration tasks. By adding the addon name
    in the file *kubernetes-setup/k8sDefaultAddons/tasks/enableK8sDefaultAddons.yml*, more addons can be enabled by default.

## URLs

* <https://en.wikipedia.org/wiki/Vagrant_(software)>
