# Tekton

Tekton an cloud native open-source framework for creating CI/CD systems. The next steps
are describing the installation process on the Kubernetes-playground.

## Install Pipelines

Install the core component *Tekton Pipelines*

``` bash
kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
```

After a moment *Tekton Pipline* should run in his own namespace.

``` bash
# Check the status of the tekton pods
kubectl get pods --namespace tekton-pipelines

# or use watch for auto refresh
watch kubectl get pods --namespace tekton-pipelines
```

## Tekton CLI

Install *tkn* the Tekton command line interface.

``` bash
sudo apt update
sudo apt install -y gnupg
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3EFE0E0A2F2F60AA
echo "deb http://ppa.launchpad.net/tektoncd/cli/ubuntu eoan main"|sudo tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list
sudo apt update && sudo apt install -y tektoncd-cli
```

## Tekton Dashboard

``` bash
kubectl apply --filename https://github.com/tektoncd/dashboard/releases/latest/download/tekton-dashboard-release.yaml
```

### Access via port-forward

After a setup of a *port-forward* to the *tekton-dashboard* service, it is possible to
access the Dashboard in your Browser with the URL <http://127.0.0.1:9097>

``` bash
kubectl --namespace tekton-pipelines port-forward svc/tekton-dashboard 9097:9097
```

### Ingress

Next the *Tekton Dashboard* is exposed to the outside.

A *Kubernetes Ingress* consists of an *Ingress Controller* and an *Ingress Resources*. The controller is in a nutshell
a http proxy, which will forward the traffic to the service/pod. In contrast is the *resource* the configuration of the
controller behavior.

It is possible to use the same controller for several resources.

```bash
# Enable a Ingress controller
vagrant ssh -c "microk8s.enable ingress"

# Create a ingress
kubectl apply -f k8s-apps/tekton/tekton-dashboard-ingress.yaml
```

The nginx is now reachable from outside the cluster, to test it open <http://tekton.k8s.home> in
a Browser.

## Hello Tekton Task

In the next steps a simple *hello world* task is created, executed and the
result is checked. The taskrun is visible on the shell and the dashboard.

``` bash
# Create the hello task in the default namespace
kubectl apply -f k8s-apps/tekton/hello-task.yaml

# Dry run from the shell
tkn task start hello --dry-run

# Start the command form the shell
tkn task start hello

# View the logs of the last taskrun
tkn taskrun logs --last -f
```

## URLs

- <https://tekton.dev>
- <https://tekton.dev/docs/getting-started/#installation>
