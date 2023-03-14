FROM ubuntu:18.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y gnupg && \
    apt-get install -y openssh-server && \
    apt-get install -y curl && \
    apt-get install -y wget && \
    apt-get install -y nano && \
    apt-get install -y iputils-ping && \
    apt-get install -y net-tools && \
    apt-get install -y iproute2 && \
    apt-get install -y vim && \
    apt-get install -y iperf

# Install MongoDB
RUN apt-get install -y gnupg && \
    wget -qO - https://www.mongodb.org/static/pgp/server-4.0.asc | apt-key add - && \
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list && \
    apt-get update && \
    apt-get install -y mongodb-org

# Install Redis
RUN apt-get install -y redis-server

# Expose ports
EXPOSE 22 27017 6379

# Start services
CMD ["/bin/bash", "-c", "service mongodb start && service redis-server start && /usr/sbin/sshd -D"]
