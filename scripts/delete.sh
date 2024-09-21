#!/bin/bash

CONTAINER_REGISTRY=${CONTAINER_REGISTRY:-bookstorepart5.azurecr.io}
VERSION=${VERSION:-latest}

kubectl delete -f ./scripts/kubernetes/deployment.yaml