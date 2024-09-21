#!/bin/bash

set -u

: "${CONTAINER_REGISTRY:=bookstorepart5.azurecr.io}"
: "${VERSION:=latest}"
: "${REGISTRY_UN:=bookstorepart5}"
: "${REGISTRY_PW:=redacted}"

set -e

echo "$REGISTRY_PW" | docker login "$CONTAINER_REGISTRY" --username "$REGISTRY_UN" --password-stdin

docker push "$CONTAINER_REGISTRY/book:$VERSION"
docker push "$CONTAINER_REGISTRY/inventory:$VERSION"
