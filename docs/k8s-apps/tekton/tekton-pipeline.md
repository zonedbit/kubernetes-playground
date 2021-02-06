# Tekton Pipeline

In this next steps a Tekton Task and Pipeline is configured to build
the [Spring PetClinic Sample Application](https://github.com/spring-projects/spring-petclinic.git).

As the Spring PetClinic is a Maven based project, a persistent volume claim is configured,
to cache the dependencies.

## Prepare the cluster

```bash
# Enable storage for a persistence volume claim, to cache the maven dependencies
vagrant ssh -c "microk8s.enable storage"

# Enable DNS, to resolve domain names during the build
vagrant ssh -c "microk8s.enable dns"
```

## Create a PersistentVolumeClaim

First, the persistence volume claim is created, to cache the maven
dependencies. From the second build, a download of the dependencies can avoid
and the build will gain speed, as .

```bash
kubectl apply -f k8s-apps/tekton/pipeline/maven-repo-pvc.yaml
```

## Create a Task

A *task* is a series of *steps*, which are executed in the same kubernetes pod.
Each *step* runs in separate container in the same pod.

This maven task is independent form a specific maven project and can be reused
across multiple maven project.

```bash
kubectl apply -f k8s-apps/tekton/pipeline/maven-task.yaml

```

## Create a Pipeline

Pipelines are a group of multiple tasks, with the key characteristic:

* Each pipeline is executed is a separate pod
* Multiple pipelines are connected by a directed acyclic graph (DAG)
* Pipelines are executed in the graph order

```bash
kubectl apply -f k8s-apps/tekton/pipeline/maven-build-pipeline.yaml
```

## Start a pipeline run

The *Pipeline* is like a class in object oriented programming and abstract description, without specific values.
A *PipelineRun* is the instantiation and execution of a *Pipeline* with specific values.

```bash
kubectl create -f k8s-apps/tekton/pipeline/run/spring-petclinic-pipeline-run.yaml
```

## URLs

* <https://tekton.dev/docs/concepts/>
* <https://kubernetes.io/docs/concepts/storage/persistent-volumes/>
* <https://developers.redhat.com/blog/2020/02/26/speed-up-maven-builds-in-tekton-pipelines/>
