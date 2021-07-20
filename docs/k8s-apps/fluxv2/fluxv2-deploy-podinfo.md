# Deploy Podinfo

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
git repository which should be deployed to Kubernetes cluster.

``` sh
flux create source git podinfo \
  --url=https://github.com/stefanprodan/podinfo \
  --branch=master \
  --interval=30s \
  --export > ./clusters/green/podinfo-source.yaml
```

After running this command a CRD is created, and can be pushed
to the git repository.

``` sh
git add -A && git commit -m "Add podinfo GitRepository"
git push
```

A moment later the git repository should appear as a new CRD and pointing to the
GitHub repository of *Podinfo*

``` sh
kubectl get gitrepositories.source.toolkit.fluxcd.io --all-namespaces

NAMESPACE     NAME          URL                                                      READY   STATUS                                                                 AGE
flux-system   podinfo       https://github.com/stefanprodan/podinfo                  True    Fetched revision: master/627d5c4bb67b77185f37e31d734b085019ff2951      51m
flux-system   flux-system   ssh://git@github.com/zonedbit/flux-conf-playground.git   True    Fetched revision: flux-conf/70d9f421bb9347101c52dd20580fcbeddd2a218a   65m
```

## Deploy Podinfo via kustomization

Now the *Podinfo* microservie will be deployed to the Kubernetes cluster.
Therefor the flux cli is used to create a kustomization CRD. Pushing the *Podinfo* kustomization
CRD to the git repository, leads to the deployment of the *Podinfo* microservice.

``` sh
flux create kustomization podinfo \
  --source=podinfo \
  --path="./kustomize" \
  --prune=true \
  --validation=client \
  --interval=5m \
  --export > ./clusters/green/podinfo-kustomization.yaml
```

``` sh
git add -A && git commit -m "Add podinfo Kustomization"
git push
```

By creating a port-forward it is possible to access *Podinfo*
in a Browser via <http://127.0.0.1:8080>

``` sh
kubectl port-forward service/podinfo 8080:9898
```

## URLs

* <https://github.com/stefanprodan/podinfo>
