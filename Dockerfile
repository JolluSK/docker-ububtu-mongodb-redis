FROM ubuntu:18.04

# Set root password
RUN echo 'root:root' | chpasswd

# Install dependencies
RUN apt update && \
    apt install -y gnupg wget openssh-server curl nano iputils-ping net-tools iproute2 vim iperf

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

RUN mkdir /run/sshd

# Start services
CMD ["/bin/bash", "-c", "/usr/bin/mongod --fork --logpath /var/log/mongodb.log --config /etc/mongod.conf && /usr/bin/redis-server /etc/redis/redis.conf && /usr/sbin/sshd -D"]
