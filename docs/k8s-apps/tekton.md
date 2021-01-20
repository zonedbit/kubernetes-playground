# Tekton

## Install Pipelines

Install the core component *Tekton Pipelines*

``` bash
kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
```

After a moment *Tekton Pipline* should run in his own namespace.

``` bash
kubectl get pods --namespace tekton-pipelines
```

## URLs

- <https://tekton.dev/docs/getting-started/#installation>
