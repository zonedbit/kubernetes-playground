#!/bin/bash

KUBE_CONF_DIR="$PWD/.kubeconf"
KUBE_CONF_FILE="config"
KUBE_CONFIGURATION="$KUBE_CONF_DIR/$KUBE_CONF_FILE"

K8S_DOMAIN="k8s\.home"

# create the config directory
if [ ! -d "$KUBE_CONF_DIR" ]; then
  mkdir $KUBE_CONF_DIR
fi

# Copy the configuration to the host
vagrant ssh -c microk8s.config > "$KUBE_CONFIGURATION"

# replace the IP with the DNS name
sed -i -r 's/([0-9]{1,3}\.){3}[0-9]{1,3}/vi\-k8s\.home/g' "$KUBE_CONFIGURATION"

# Add the configuration to the path
export KUBECONFIG="$KUBE_CONFIGURATION"