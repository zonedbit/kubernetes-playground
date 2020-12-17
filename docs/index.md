# Kubernetes-Playground Handbook

The Kubernetes-Playground is a solution to setup a simple Kubernetes-Cluster
with minimal effort, to learn and play with Kubernetes.

## Prerequisites
The usages of the Kubernetes-Playground requires the installation
of the following software on the host:

* Virtualbox
* Vagrant
* Ansible


## Project layout
``` bash
.                       # Project root
├── docs                # documentation
├── kubernetes-setup    # Ansible scripts to provision the vagrant box
├── mkdocs.yml          # configuration file for mkdocs
├── README.md           # Readme file for github
└── Vagrantfile         # Configuration of the vagrant box
```