#!/bin/bash
export $(grep -v '^#' .env | xargs)

TOKEN_ENDPOINT="http://localhost:8080/realms/dedalus/protocol/openid-connect/token"
ORION_ENDPOINT="http://localhost/orion/ngsi-ld/v1/entities"

# Request Token and Use in Bearer Authorization
curl -iX POST \
    $ORION_ENDPOINT \
    -H "Authorization: Bearer $(curl -s -X POST "$TOKEN_ENDPOINT" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -d "grant_type=password" \
        -d "client_id=${ORION_CLIENT_ID}" \
        -d "client_secret=${ORION_CLIENT_SECRET}" \
        -d "username=${USERNAME}" \
        -d "password=${PASSWORD}" | jq -r .access_token)" \
    -H 'Content-Type: application/json' \
    -H 'Link: <https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld>; rel="http://www.w3.org/ns/json-ld#context"; type="application/ld+json"' \
    --data-raw '{
        "id": "urn:ngsi-ld:TemperatureSensor:001",
        "type": "TemperatureSensor",
        "category": {
                "type": "Property",
                "value": "sensor"
        },
        "temperature": {
                "type": "Property",
                "value": 25,
                "unitCode": "CEL"
        }
    }'
