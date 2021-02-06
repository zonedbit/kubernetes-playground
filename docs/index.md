# Kubernetes-Playground Handbook

The Kubernetes-Playground is a solution to setup a simple Kubernetes-Cluster
with minimal effort, to learn and play with Kubernetes, see [GitHub](https://github.com/zonedbit/kubernetes-playground)

## Project layout

``` bash
.                       # Project root
├── .github             # the github workflow files
├── bin                 # project specific binaries, like plantuml.jar; excluded from version control
├── docs                # documentation
├── kubernetes-setup    # Ansible scripts to provision the vagrant box
├── mkdocs.yml          # configuration file for mkdocs
├── README.md           # Readme file for github
└── Vagrantfile         # Configuration of the vagrant box
```
