# Deploy Podinfo - Helm

*Podinfo* is a microservice to demonstrate best practices of
running a microservice in a Kubernetes cluster. In this chapter
*Podinfo* is used a deployment unit and deployed with FluxV2
kustomization controller.

## Prerequisites

* FluxV2 installed in a Kubernetes cluster
* A septate configuration git repository,
  the repository from the installation section is sufficient

## Adding Git repository as flux source

First, the flux configuration repository must be cloned to the
local computer.

``` sh
git clone git@github.com:zonedbit/flux-conf-playground.git

git checkout flux-conf

cd flux-conf-playground
```

In the next step a CRD is created, this is a representing the
helm repository which should be deployed to Kubernetes cluster.

``` sh
flux create source helm podinfo \
--namespace=default \
--url=https://stefanprodan.github.io/podinfo \
--interval=10m \
--export > ./clusters/green/podinfo-source-helm.yaml
```

After running this command a CRD is created, and can be pushed
to the git repository.

``` sh
git add -A && git commit -m "Add podinfo HelmRepository"
git push
```

A moment later the helm repository should appear as a new CRD and pointing to the
HELM repository of *Podinfo*

``` sh
flux get sources helm -A

NAMESPACE NAME    READY MESSAGE                                                     REVISION                                  SUSPENDED
default   podinfo True  Fetched revision: 8411f23d07d3701f0e96e7d9e503b7936d7e1d56  8411f23d07d3701f0e96e7d9e503b7936d7e1d56  False
```

## Deploy Podinfo via Helm

In the first step a simple value yaml is create to configure the helm chart.

``` sh
cat > ./clusters/green/podinfo-values.yaml <<EOL
replicaCount: 4
resources:
  limits:
    memory: 256Mi
  requests:
    cpu: 100m
    memory: 64Mi
EOL
```

Now the *Podinfo* microservie will be deployed to the Kubernetes cluster.
Therefor the flux cli is used to create a helmrelease CRD. Pushing the *Podinfo* helmrelease
CRD to the git repository, leads to the deployment of the *Podinfo* microservice.

``` sh
flux create helmrelease podinfo \
--namespace=default \
--source=HelmRepository/podinfo \
--release-name=podinfo \
--chart=podinfo \
--chart-version=">5.0.0" \
--values=./clusters/green/podinfo-values.yaml \
--export > ./clusters/green/podinfo-helmrelease.yaml
```

``` sh
git add -A && git commit -m "Add podinfo helmrelease"
git push
```

By creating a port-forward it is possible to access *Podinfo*
in a Browser via <http://127.0.0.1:8080>

``` sh
kubectl port-forward service/podinfo 8080:9898
```

## URLs

* <https://github.com/stefanprodan/podinfo>
