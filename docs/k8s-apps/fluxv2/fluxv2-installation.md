# Install Flux V2

## Prerequisites

* A Kubernetes cluster to install FluxV2
* A Git Repository to manage the FluxV2 configuration
    * This repository is used by FluxV2 to manage is own configuration.
    * For testing purpose, the easy way is to create a private GitHub repository

## Verify the cluster

``` sh
# Ensure that the cluster fullfil the flux prerequisites.
flux check --pre
```

## Install FluxV2

* In the next command replace the URL against your own repository
    * In URL provided by GitHub to clone the repository
      must the `:` after the top-level domain com replaced against a `/`
* During the installation FluxV2 will generate a pair of private and public ssh keys
    * The public key is printed to the terminal and before continuing the installation
      the key must be added to the GitHub repo
    * Go to GitHub `repository -> Settings -> Deploy Keys -> Add deploy keys`
    * Not sure if needed, just give FluxV2 write access to the repository. It is
      a playground to make things easy and not production ready.

``` sh
# Replace the URL with the your configuration repository
flux bootstrap git \
  --url=ssh://git@github.com/zonedbit/flux-conf-playground.git \
  --branch=flux-conf \
  --path=clusters/green
```

After a moment and executing the command `flux check` you should
see a similar result.

``` sh
➜  flux check
► checking prerequisites
✔ kubectl 1.21.1 >=1.18.0-0
✔ Kubernetes 1.21.1-3+ba118484dd39df >=1.16.0-0
► checking controllers
✔ helm-controller: deployment ready
► ghcr.io/fluxcd/helm-controller:v0.11.1
✔ kustomize-controller: deployment ready
► ghcr.io/fluxcd/kustomize-controller:v0.13.2
✔ notification-controller: deployment ready
► ghcr.io/fluxcd/notification-controller:v0.15.0
✔ source-controller: deployment ready
► ghcr.io/fluxcd/source-controller:v0.15.3
✔ all checks passed
```

## URLs

* <https://fluxcd.io/docs/>
