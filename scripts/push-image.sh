#!/bin/bash

set -u

: "${CONTAINER_REGISTRY:=bookstorepart5.azurecr.io}"
: "${VERSION:=latest}"
: "${REGISTRY_UN:=bookstorepart5}"
: "${REGISTRY_PW:=g9TE6sJmPH6i2j6yBwv5Q/fEO7g/YJS3ypPen3KKb3+ACRCWgRoe}"

set -e

echo "$REGISTRY_PW" | docker login "$CONTAINER_REGISTRY" --username "$REGISTRY_UN" --password-stdin

docker push "$CONTAINER_REGISTRY/book:$VERSION"
docker push "$CONTAINER_REGISTRY/inventory:$VERSION"