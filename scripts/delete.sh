#!/bin/bash

CONTAINER_REGISTRY=${CONTAINER_REGISTRY:-awesomedevops.azurecr.io}
VERSION=${VERSION:-latest}

kubectl delete -f ./scripts/kubernetes/deployment.yaml