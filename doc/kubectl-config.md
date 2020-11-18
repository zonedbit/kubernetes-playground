# Configuration of kubectl
The next bash snippets outlines, the installation and configuration to use kubectl to access microk8s in a vagrant box.  

## Install kubectl
```bash
# Install kubectl via snap
sudo snap install kubectl --classic
```

## kubectl configuration
```bash
# Create the configuration folder in the home path
mkdir .kube

# get the configuration from the vagrant box
# if the config file already exist, it is needed to merege them
vagrant ssh -c microk8s.config >> ~/.kube/config

# change the server ip to the external ip of the vagrant box
vi ~/.kube/config
```

## bash bash-completion
```bash
sudo kubectl completion bash >/etc/bash_completion.d/kubectl
```