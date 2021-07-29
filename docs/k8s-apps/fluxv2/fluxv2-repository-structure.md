# Repository Structure

## Create configuration repository

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

## Configuration Repository Structure

At the top level the configuration repository contains three apps, clusters, and infrastructure folders.
In the next sub-section the meaning of these folders are explained.

``` sh
.
├── apps
│   ├── base
│   │   └── podinfo
│   │       ├── ingress.yaml
│   │       ├── kustomization.yaml
│   │       ├── namespace.yaml
│   │       └── release.yaml
│   └── staging
│       ├── kustomization.yaml
│       └── podinfo-values.yaml
├── clusters
│   └── staging
│       ├── apps.yaml
│       └── infrastructure.yaml
└── infrastructure
    └── sources
        ├── kustomization.yaml
        └── podinfo-source-helm.yaml
```

### clusters

* The *clusters* folder contains one folder for each cluster or environment,
      which should be managed by *FluxV2*.
* During the bootstrapping of *FluxV2*, the path (entry point) for flux is set to the
      folder *clusters/staging*
* The *infrastructure.yaml* points to the infrastructure folder. Hence, flux will apply
      the kustomization in the infrastructure folder
* The *apps.yaml* points to the *apps/staging* overlay of kustomize. As the *app.yaml* defines
      a dependency to the *infrastructure.yaml*, flux will apply the *apps.yaml* after the
      *infrastructure.yaml*.

### infrastructure

### apps

### Bootstrap the Staging Environment

``` sh
# Bootstrap Flux
flux bootstrap git \
  --url=ssh://git@github.com/zonedbit/flux-conf-playground.git \
  --branch=main \
  --path=./clusters/staging
```

## URLs

* <http://podinfo.k8s.home>
* <https://github.com/fluxcd/flux2-kustomize-helm-example>
