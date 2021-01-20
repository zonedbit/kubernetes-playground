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

## Tekton CLI

Install *tkn* the Tekton command line interface.

``` bash
sudo apt update
sudo apt install -y gnupg
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3EFE0E0A2F2F60AA
echo "deb http://ppa.launchpad.net/tektoncd/cli/ubuntu eoan main"|sudo tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list
sudo apt update && sudo apt install -y tektoncd-cli
```

## URLs

- <https://tekton.dev/docs/getting-started/#installation>
