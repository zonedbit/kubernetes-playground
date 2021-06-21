# Run a Container for Analysis

It can be helpful to execute a command such as `ping` or `dig`
from inside a cluster. By doing this it is possible to see
the response, which a pod would get. This might be valuable to
analyze DNS or other network connection error.

## Starting a BusyBox container

```bash
kubectl run busybox --image=busybox:1.33 --rm -it --restart=Never /bin/sh
```

## Starting a Ubuntu container

```bash
kubectl run ubuntu --image=ubuntu --rm -it --restart=Never /bin/bash
```

## Explanation

* **run**, create and run a container
* **busybox/ubuntu**, is the name of the container and can be replaced by any valid name
* **rm**, delete the container image after execution
* **it**, interactive terminal
* **restart=Never**, after termination the container should not restart;
         default behavior of Kubernetes
