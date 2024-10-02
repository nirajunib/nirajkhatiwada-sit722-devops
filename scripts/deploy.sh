#!/bin/bash

set -u

export KUBECONFIG=/var/lib/jenkins/.kube/config
echo "Deploying to Kubernetes..."
kubectl apply -f ./scripts/kubernetes/deployment.yaml


