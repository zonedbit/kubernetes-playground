# Installation Guide

The Kubernetes-Playground is build and tested on Ubuntu 20.04.
Hence, the described steps are focusing on Ubuntu. It should be
possible to use any Operation system as a host.

## Required

Before starting to use this project, make sure that the following
software is installed on the system:

* VirtualBox, <https://www.virtualbox.org/wiki/Downloads>
* Vagrant, <https://www.vagrantup.com/downloads>

``` bash
apt install virtualbox vagrant
```

## Optional - Documentation

To generate a searchable HTML documentation `mkdocs` must be installed
on the system

```bash
# Install mkdocs
sudo apt install mkdocs

# Install pip
sudo apt install python3-pip

# Make sure latest version is used
pip3 install --upgrade mkdocs
```

### Plantuml

* By the first use of he makefile in the docs folder, plantuml is downloaded
* For some diagrams plantuml depends on graphviz. Hence, it must be installed.

```bash
# Install graphviz
sudo apt install graphviz
```
