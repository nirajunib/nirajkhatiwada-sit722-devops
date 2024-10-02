#!/bin/bash

set -u

export KUBECONFIG=/home/ubuntu/.kube/config
echo "Deploying to Kubernetes..."
kubectl apply -f ./scripts/kubernetes/deployment.yaml
