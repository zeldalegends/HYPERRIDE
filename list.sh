#!/bin/bash

# docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.ID}}" | sort
# docker ps -a --format "table {{.Networks}}\t{{.Names}}\t{{.RunningFor}}\t{{.Image}}\t{{.Command}}\t{{.Mounts}}"
docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}\t{{.Ports}}\t{{.ID}}"

# read enter
# docker compose logs -n 10 -f
