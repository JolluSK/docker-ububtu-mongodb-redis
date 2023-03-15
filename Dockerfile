FROM ubuntu:18.04

# Install dependencies
RUN apt update && \
    apt install -y gnupg && \
    apt install -y wget && \
    apt install -y openssh-server && \
    apt install -y curl && \
    apt install -y nano && \
    apt install -y iputils-ping && \
    apt install -y net-tools && \
    apt install -y iproute2 && \
    apt install -y vim && \
    apt install -y iperf

# Add MongoDB repository key and source list
RUN curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc |  apt-key add - && \
    apt-key list && \
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" |  tee /etc/apt/sources.list.d/mongodb-org-4.4.list

# Install MongoDB
RUN apt update && apt install -y mongodb-org

# Install Redis
RUN apt update && apt install -y redis-server

# Expose ports
EXPOSE 22 27017 6379

# Start services
CMD ["/bin/bash", "-c", "service mongodb start && service redis-server start && /usr/sbin/sshd -D"]
