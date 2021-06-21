# Jenkins Operator

This section will guide you through the process of installing Jenkins in
the Kubernetes cluster.

## Enable DNS

During the installation Jenkins will fetch updates, therefore DNS is needed.

```bash
# Enable DNS
vagrant ssh -c "microk8s.enable dns"
```

## Install Operator

### Configure Custom Resource Definition

Create the custom resource definition for the jenkins operator

```bash
# Apply the custom resource definition
kubectl apply -f https://raw.githubusercontent.com/jenkinsci/kubernetes-operator/master/deploy/crds/jenkins_v1alpha2_jenkins_crd.yaml

# Get all custom resource definition - there should be two custom resource definition:
#  - jenkins.jenkins.io
#  - jenkinsimages.jenkins.io
kubectl get customresourcedefinitions.apiextensions.k8s.io

# Delete the custom resource definition
kubectl delete customresourcedefinitions.apiextensions.k8s.io jenkins.jenkins.io
kubectl delete customresourcedefinitions.apiextensions.k8s.io jenkinsimages.jenkins.io
```

### Deploy Operator - using yaml

Create the Operator in the default namespace

```bash
kubectl apply -f https://raw.githubusercontent.com/jenkinsci/kubernetes-operator/master/deploy/all-in-one-v1alpha2.yaml
```

In the default namespace should be a pod running with the name *jenkins-operator-\**. This can be checked with:

```bash
kubectl get pods --all-namespaces
```

## Deploy Jenkins

```bash
kubectl apply -f k8s-apps/jenkins/jenkins_instance.yaml
```

After a while a jenkins pod should be running

```bash
watch kubectl get pods
```

In the case that the jenkins pod is in a restarting loop, check if DNS is enabled.

```bash
# Connect to the vagrant box
vagrant ssh

# Check the status - dns should be listed by the enabled addons
microk8s.status

# or as a one liner
vagrant ssh -c "microk8s.status"
```

### Credentials

The postfix \*-*my-jenkins*, must be same as in the *jenkins_instance.yaml* in the section *metadata.name*

```bash
# The user Name of the Jenkins instance
echo "User:"; kubectl get secret jenkins-operator-credentials-my-jenkins -o 'jsonpath={.data.user}' | base64 -d | xargs echo

echo "Password:"; kubectl get secret jenkins-operator-credentials-my-jenkins -o 'jsonpath={.data.password}' | base64 -d | xargs echo
```

### Access the Jenkins

By default Kubernetes is not routing traffic to any pods. It is possible to route your local traffic to Kubernetes
by creating a *port-forward*

```bash
# Create a port-forwarding from local host to the
kubectl port-forward jenkins-my-jenkins 8080:8080
```

After executing this command, it is possible to open the URL <http://127.0.0.1:8080> and login to Jenkins.


## URLs

- <https://jenkinsci.github.io/kubernetes-operator/docs/>
- <https://github.com/jenkinsci/kubernetes-operator>
    - The files (such as custom resource definition), are in the *deploy* folder
