CLIENT_ID="orion"
CLIENT_SECRET="u0uEieRqtUVrXPluUAiuvGAZ2Qk4Bco6"
USERNAME="myuser"
PASSWORD="myuser"

curl -X POST \
  http://localhost:8080/realms/dedalus/protocol/openid-connect/token \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "grant_type=password" \
  -d "client_id=$CLIENT_ID" \
  -d "client_secret=$CLIENT_SECRET" \
  -d "username=$USERNAME" \
  -d "password=$PASSWORD" | jq {access_token}