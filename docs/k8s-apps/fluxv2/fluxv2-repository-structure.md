# Repository Structure

## Create configuration repository

* Create a github repository, which can be used to store the configuration.

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

* In this example the *infrastructure* folders contains one sub-folder *sources*.
* The *sources* folder, contains a pointer to a helm repository.
* This helm repository is used for pulling the app into the cluster

### apps

* The *apps* is in a nutshell the configuration of the app/microserive based on kustomize
* The *base* folder contains the *podinfo* folder, which is in this example the unit of deployment
    * Here is the default configuration stored
    * The *namespace.yaml*, creates the namespace podinfo
    * The *release.yaml*, installs the podinfo helm chart to the cluster
    * The *ingress.yaml*, creates an ingress resource, so that ingress traffic is routed to the pod
* The *staging* folder, is a kustomize overlay. This overlay points to the base configuration and applies some
    cluster specific configuration.

### Bootstrap the Staging Environment

In the last step the *staging* environment is bootstrapped, here it
is important the `path` parameter points to the folder *./clusters/staging*.

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
