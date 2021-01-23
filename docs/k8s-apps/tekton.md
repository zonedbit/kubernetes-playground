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

After the setup of a *port-forward* to the *tekton-dashboard* service, it is possible to
access the Dashboard in your Browser with the URL <http://127.0.0.1:9097>

``` bash
kubectl --namespace tekton-pipelines port-forward svc/tekton-dashboard 9097:9097
```

### Ingress

Next the *Tekton Dashboard* is exposed to the outside. Therefore, a *ingress configuration* is created.
The concept of ingress controllers are explained in the [Nginx](nginx.md) chapter.

```bash
# Enable a Ingress controller
vagrant ssh -c "microk8s.enable ingress"

# Create a ingress
kubectl apply -f k8s-apps/tekton/tekton-dashboard-ingress.yaml
```

The *tekton-dashboard* is now reachable from outside of the cluster, via the URL <http://tekton.k8s.home>.

Instead of the external cluster IP Address, a sub-domain is used to access the *tekton-dashboard*. This makes
the ingress configuration easier, when a web-application loads resources by their absolute URL; otherwise the
URL rewriting in the ingress configuration gets challenging.
For details, see the [network configuration](../network-configuration.md) chapter.

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
