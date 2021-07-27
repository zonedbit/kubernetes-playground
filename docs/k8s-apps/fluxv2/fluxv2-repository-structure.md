# Repository Structure

## Configure the source repository

* Create a github repository

``` sh
# Move to the temp folder
cd /tmp

# Clone the flux configuration repository
git clone git@github.com:zonedbit/flux-conf-playground.git

# Copy the configuration files to the repository
# Assuming the working directory is the kubernetes-playground folder
cp -r ./k8s-apps/flux-repository-structure-example/* /tmp/flux-conf-playground/

# Push the configuration to the github repository
git add -A && git commit -m "Add environment and podinfo configuration" && git push
```

### Bootstrap the Staging Environment

``` sh
# Bootstrap Flux
flux bootstrap git \
  --url=ssh://git@github.com/zonedbit/flux-conf-playground.git \
  --branch=main \
  --path=./clusters/staging
```

### Open Podinfo

<http://podinfo.k8s.home>

## Folder structure

TODO
