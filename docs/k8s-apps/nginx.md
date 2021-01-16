# Ngnix

## Deployment Diagram

![Nginx Deployment Diagram](../diagrams/k8s_nginx_deployment_diagram.svg)

## Deploy Ngnix

### Deployment

In the first step three *Nginx* instances are deployed to the *Kubernetes Cluster*. All three instances providing the
same content, a simple *"Hello World"*

```bash
# Creates the deployment and rollout three nginx instances
kubectl apply -f k8s-apps/nginx/nginx-deployment.yaml
```

Next the *nginx-service* is deployed, this is a *kubernetes* resource to expose the
pods to the internal network of the *cluster*.

### Service

```bash
# Create a service which will route the traffic to one of the three nginx pods
kubectl apply -f k8s-apps/nginx/nginx-service.yaml
```

The pods are dynamically deployments, which means that pods can be created and destroyed at anytime.
Consequently, the network configuration such as IP Addresses will change. Besides, all three pods are serving the same content
and it is just relevant which pod will handle the request.

A *Kubernetes Service* solve this by giving as a stable *DNS* name and ensuring that the request it routed to one of the three pods.

#### Testing the Service

Services are just accessible within the *Cluster*, thus to test the configuration it is needed to create a *Port-Forward* from
the client to the *Kubernetes Cluster*.

```bash
# Create a port-forwarding from local host to the service
kubectl port-forward service/my-ngnix-service 8080:8080
```

Opening <http://192.168.60.10:8080> in a browser should show us the default Nginx start page.

### Ingress

The goal of the last step is to expose the *Nginx* to the outside. Network traffic which is entering a network is called
*ingress*, traffic leaving a network is called *egress*.

A *Kubernetes Ingress* consists of an *Ingress Controller* and an *Ingress Resources*. The controller is in a nutshell
a http proxy, which will forward the traffic to the service/pod. In contrast is the *resource* the configuration of the
controller behavior.

It is possible to use the same controller for several resources.

```bash
# Enable a Ingress controller
vagrant ssh -c "microk8s.enable ingress"

# Create a ingress
kubectl apply -f k8s-apps/nginx/nginx-ingress.yaml
```

The nginx is now reachable from outside the cluster, to test it open <http://192.168.60.10/path-of-my-ingress> in
a Browser.

## How related resources are tied

- The pod deployment resource file *nginx-deployment.yaml*, specifics labels. These labels are useful
    to select a set of pods, e.g. for searching pods or linking resources together.
- In the service resource file *nginx-service.yaml* the selector directive is used to select all pods with a specific set of labels.
    In this example the label *app: nginx* is used.
- The *name* directive is used in the ingress resource *nginx-service.yaml*, to connect the ingress with the service.

## Routing Network traffic

![Nginx Network traffic](../diagrams/k8s_nginx_network_traffic.svg)

- The *nginx-ingress* accept http request on port 80 from the client.
- All traffic on port 80 is forwarded from the *nginx-ingress* to the *nginx-service* on Port 8080
- The request which the *nginx-service* received on port 8080 is forwarded to exactly one *nginx-pod* on port 80

## URLs

- <https://kubernetes.io/docs/concepts/workloads/controllers/deployment/>
- <https://kubernetes.io/docs/concepts/services-networking/service/>
- <https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/>
- <https://kubernetes.io/docs/concepts/services-networking/ingress/>