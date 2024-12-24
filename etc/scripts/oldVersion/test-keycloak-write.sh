curl -iX POST \
    http://localhost/orion/ngsi-ld/v1/entities \
    -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJrblF3enB1UG1iZFZxY3g1bFBoNjhkd19SMC1McGI4NG42OUlOVGJtcEJzIn0.eyJleHAiOjE3MzM4Mzk4OTQsImlhdCI6MTczMzgzOTU5NCwianRpIjoiZDg5ZTk4ZTktZDRkNy00ZGVjLTg4NGMtZjAwMmNkMjc5MjBlIiwiaXNzIjoiaHR0cDovL2tleWNsb2FrOjgwODAvcmVhbG1zL2RlZGFsdXMiLCJzdWIiOiJjOTgwYTIwZC04NjU3LTRiYzEtYTJiNy04ZWE4OTcwZDRhZjgiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJvcmlvbiIsInNlc3Npb25fc3RhdGUiOiJjM2NlZDllNy1lYWMwLTQyOTItOTMzMi1mODU2NDVjNDUyYmIiLCJzY29wZSI6Im9wZW5pZCIsInNpZCI6ImMzY2VkOWU3LWVhYzAtNDI5Mi05MzMyLWY4NTY0NWM0NTJiYiJ9.tNVYWFKDF8gW-5IPb9-5aE_Pw8XBT-BFqYdJCb1V_ZalqTL3EhyFKD9OfinPZwjHgfte5enVuWskbLXr5l02T-VzJ0_rEJAacvr0Apf_4BD_dTfrdSxAQyKTnbss8BOsBa_Du3w6HekFiI3dAvFvNwPo424v7KI0rqSASo5hbpXiYeDo3kFD_gctEqvLuVOaEVF_gdb37LGTg3yMeawIMm5bJ5rwhdfzqhMb2aZIhq886GI1-_Hhi2Y8k6SOTIFAq_Pdzy-lOJiFXXHHwvdkAUDcZStvV3pxPqqqXoy4RvS-YEkuY02Hc0Twd-1RmQstZPjgq-OA9bvKSMgV6-z8PQ" \
    -H 'Content-Type: application/json' \
    -H 'Link: <http://context/data-models/ngsi-context.jsonld>; rel="http://www.w3.org/ns/json-ld#context"; type="application/ld+json"' \
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