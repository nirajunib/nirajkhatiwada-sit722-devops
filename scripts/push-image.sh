#!/bin/bash

set -u

: "${CONTAINER_REGISTRY:=awesomedevops.azurecr.io}"
: "${VERSION:=latest}"
: "${REGISTRY_UN:=awesomedevops}"
: "${REGISTRY_PW:=redacted}"

set -e

echo "$REGISTRY_PW" | docker login "$CONTAINER_REGISTRY" --username "$REGISTRY_UN" --password-stdin

docker push "$CONTAINER_REGISTRY/book:$VERSION"
docker push "$CONTAINER_REGISTRY/inventory:$VERSION"
