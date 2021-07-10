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
. <(flux completion zsh) && compdef _flux flux
```
