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

## URLs

* [About Vagrant](https://en.wikipedia.org/wiki/Vagrant_(software))