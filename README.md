# Docker Ubuntu MongoDB Redis

#### This Is A Docker Project Containing Ubuntu With Mongodb And Redis.

## Building the Docker Image

#### To build the Docker image, run the following command:

```
docker build -t my-ubuntu-mongodb-redis .
```

## Starting the Docker Container

##### To Start The Docker Container, Run The Following Command, Mapping The Ssh Port To Port 2222 On The Host, The Mongodb Port To Port 27017 On The Host, And The Redis Port To Port 6379 On The Host. The Mongodb Data Will Be Persisted In The Mongodb-Data Volume:

```
docker run -d -p 2222:22 -p 27017:27017 -p 6379:6379 \
-v mongodb-data:/data/db \
--name my-ubuntu-mongodb-redis \
my-ubuntu-mongodb-redis
```

## Connecting to the Ubuntu Container via SSH

##### To connect to the Ubuntu container via SSH, run the following command, with the default username "root" and password "root":

```
ssh root@localhost -p 2222
```

## Accessing Ubuntu via Docker

##### To access Ubuntu via Docker, find the IP address of the container by running the following command:

```
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' my-ubuntu-mongodb-redis
```

##### Then connect to the container using the IP address found in the previous step, with the default username "root" and password "root":

```
ssh root@<container-ip>
```

## Persisting MongoDB Data Outside of Docker Ubuntu

##### To persist MongoDB data outside of Docker Ubuntu, create a directory on the host system and mount it to the Docker container using the following command, replacing /path/on/host with the path to the directory on the host system where you want to persist the MongoDB data:

```
docker run -d -p 2222:22 -p 27017:27017 -p 6379:6379 \
-v /path/on/host:/data/db \
--name my-ubuntu-mongodb-redis \
my-ubuntu-mongodb-redis
```

## Using the Shell Script

##### The following shell script starts the Docker container, maps the required ports for SSH, MongoDB, and Redis, and waits for the container to start. It then gets the IP address of the container and provides instructions for SSH-ing into the container and accessing MongoDB and Redis.

```
sh start.docker.sh
```
##### To use this script, save it as a file (e.g. start-docker.sh), make it executable (chmod +x start-docker.sh), and then run it (./start-docker.sh). You should be able to SSH into the container and access MongoDB and Redis using the instructions printed by the script.

##### Note: You will need to replace /path/to/host/db with the path to the directory on your
