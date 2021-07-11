# Flux V2

## Install the flux cli

``` sh
curl -s https://fluxcd.io/install.sh | sudo bash
```

### Enable Autocompletion - Bash

``` sh
vi ~/.bashrc

# Add this line
. <(flux completion bash)
```

### Enable Autocompletion - Zsh

``` sh
vi ~/.zshrc

# Add this line
source <(flux completion zsh) && compdef _flux flux
```

## Verify the cluster

``` sh
# Ensure that the cluster fullfil the flux prerequisites.
flux check --pre
```

## Install FluxV2

* Creating a git repository is a prerequisite to install FluxV2. This repository is
  used by FluxV2 to manage is own configuration.
* For testing purpose, the easy way is to create a private GitHub repository
* After the repository exists, the next command can be modified and executed
    * By the provided URL from GitHub to clone the repository
      is after the top-level domain com a : which must be replaced against a  /
* During the installation FluxV2 will generate a pair of private and public ssh keys
    * The public key is printed to the terminal and before continuing the installation
      the key must be added to the GitHub repo
* TODO location

``` sh
# Replace the URL with the your configuration repository
flux bootstrap git \
  --url=ssh://git@github.com/zonedbit/flux-conf-playground.git \
  --branch=flux-conf \
  --path=clusters/green
```
