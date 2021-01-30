# Tekton Pipeline


## Prepare the cluster

```bash
# Enable storage for a persistence volume claim
vagrant ssh -c "microk8s.enable storage"

# Enable DNS
vagrant ssh -c "microk8s.enable dns"
```

## Setup the pipeline

```bash
kubectl apply -f k8s-apps/tekton/pipeline/maven-repo-pvc.yaml

kubectl apply -f k8s-apps/tekton/pipeline/maven-task.yaml

kubectl apply -f k8s-apps/tekton/pipeline/maven-build-pipeline.yaml
```

## Start a pipeline run

```bash
kubectl create -f k8s-apps/tekton/pipeline/spring-petclinic-pipeline-run.yaml
```

## URLs

- <https://kubernetes.io/docs/concepts/storage/persistent-volumes/>
- <https://developers.redhat.com/blog/2020/02/26/speed-up-maven-builds-in-tekton-pipelines/>
