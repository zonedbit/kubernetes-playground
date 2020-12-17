# Kubernetes-Playground Handbook

The Kubernetes-Playground is a solution to setup a simple Kubernetes-Cluster
with minimal effort, to learn and play with Kubernetes.

# Prerequisites
The usages of the Kubernetes-Playground requires the installation
of the following software on the host:

* Virtualbox
* Vagrant
* Ansible

## Installation


### Documentation
```bash
# Install mkdocs
sudo apt install mkdocs

# Install pip
sudo apt install python3-pip

# Make sure latest version is used
pip3 install --upgrade mkdocs
```

## Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs help` - Print this help message.

## Project layout
```
    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.
```