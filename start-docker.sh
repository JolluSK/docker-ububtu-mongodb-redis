#!/bin/bash

# Start the Docker container and map ports for SSH, MongoDB, and Redis
docker run -d -p 22:22 -p 27017:27017 -p 6379:6379 --name my-ubuntu-redis-mongo \
-v /path/to/host/db:/data/db \
my-ubuntu-redis-mongo

# Wait for the container to start
echo "Waiting for container to start..."
sleep 10

# Get the IP address of the container
CONTAINER_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' my-ubuntu-redis-mongo)

# SSH into the container
echo "SSH into the container using this command: ssh root@$CONTAINER_IP"

# Access MongoDB
echo "To access MongoDB, connect to this address: mongodb://$CONTAINER_IP:27017"

# Access Redis
echo "To access Redis, connect to this address: redis://$CONTAINER_IP:6379"
