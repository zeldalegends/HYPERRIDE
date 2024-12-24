#!/bin/bash

#apt install jq

echo "Test /orion/version"
./scripts/version.sh

echo "Test /orion/ngsi-ld/ex/v1/version"
./scripts/versionOrion-LD.sh

echo "Write entity"
./scripts/write.sh

echo "Read entity"
./scripts/read.sh

echo "Delete entity"
./scripts/delete.sh
