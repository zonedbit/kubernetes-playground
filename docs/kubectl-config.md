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
# if the config file already exist, it is needed to merge them
vagrant ssh -c microk8s.config >> ~/.kube/config

# change the server ip to the external ip of the vagrant box or k8s.home
vi ~/.kube/config
```

Instead of the external IP Address of the vagrant box it is also possible to use the domain *k8s.home*.
Hence, the local DNS must resolve the domain to the IP of the vagrant box. This can be done by modifying the
*/etc/hosts* file or the configuration of the local DNS resolver like Unbound.

### Configuration via update script

The `updateKubeConfig.sh` provides the following functionality

* Copy the configuration from the vagrant box, to the current directory
* Replace the IP with the domain *k8s.home*
* set the environment variable KUBECONFIG to the file from the first step
  * the first dot is important; otherwise the environment variable is not set
  * from the current shell, only this configuration file is usable
  * the configuration applies only temporarily to the open shell session

```bash
. ./updateKubeConfig.sh
```

## bash bash-completion

```bash
sudo kubectl completion bash >/etc/bash_completion.d/kubectl
```
