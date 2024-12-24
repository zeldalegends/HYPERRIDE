#!/bin/bash

# Ngrok for Node-RED (jofag12024@etondy.com - SUSPENDED)
# docker run --rm --network hyperride-net --name ngrok \
# -e NGROK_AUTHTOKEN=2N790LnsQbKo5iF2teAKEdpJ7q0_6BEZbvZpgnEM32dnuf3sy ngrok/ngrok:latest http node-red:1880

# MongoExpress
docker run -d --rm \
    --network hyperride_default \
    --name mongo-express \
    -e ME_CONFIG_BASICAUTH=false \
    -e ME_CONFIG_SITE_BASEURL=/mongoadmin \
    -e ME_CONFIG_MONGODB_SERVER=mongo-db \
    mongo-express:latest
#   mongo-express:1.0.2

# Ngrok for Mongo Express (asmterni@proton.me)
# docker run --rm --network hyperride_default --name ngrok-mongo \
# -e NGROK_AUTHTOKEN=2e3OcV139oYcSUIwi0bCL4NLexU_554rNagEXCygsfFeNm7aA ngrok/ngrok:latest http fe-mongo:8081

# phpMyAdmin
# docker run -d --rm --network hyperride_default --name fe-mysql \
# -e PMA_HOST=mysql-db -e PMA_USER=root -e PMA_PASSWORD=secret phpmyadmin:latest

# Ngrok for phpMyAdmin (varago7250@crtsec.com - SUSPENDED)
# docker run --rm --network hyperride_default --name ngrok-mysql \
# -e NGROK_AUTHTOKEN=2L2kdrNlcTBcxDERiOxTW3kyEaV_3siN3rWauYmt4KLGHrHZg ngrok/ngrok:latest http fe-mysql:8080

# Ngrok for MongoExpress, Nginx and Node-RED
docker run -it --rm \
    --network hyperride_default \
    --name ngrok \
    -e NGROK_CONFIG=/etc/ngrok.yml \
    -v $(pwd)/ngrok.yml:/etc/ngrok.yml \
    --health-cmd='curl -sf http://localhost:4040' \
    ngrok/ngrok:latest start --all
#   ngrok/ngrok:3.19.0-debian start --all
