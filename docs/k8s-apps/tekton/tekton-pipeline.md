# Tekton Pipeline

```bash
# Enable storage for a persistence volume claim
vagrant ssh -c "microk8s.enable storage"

kubectl apply -f k8s-apps/tekton/pipeline/maven-repo-pvc.yaml
```

```bash
kubectl apply -f k8s-apps/tekton/pipeline/maven-task.yaml

kubectl apply -f k8s-apps/tekton/pipeline/maven-build-pipeline.yaml

kubectl create -f k8s-apps/tekton/pipeline/pet-clinic-pipeline-run.yaml
```

## URLs

- <https://kubernetes.io/docs/concepts/storage/persistent-volumes/>
