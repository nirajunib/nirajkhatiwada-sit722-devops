#!/bin/bash

set -u

: "${CONTAINER_REGISTRY:=bookstorepart5.azurecr.io}"
: "${VERSION:=latest}"

set -e

cd ./book_catalog
docker build --no-cache -t "$CONTAINER_REGISTRY/book:$VERSION" .

cd ../inventory_management
docker build --no-cache -t "$CONTAINER_REGISTRY/inventory:$VERSION" .