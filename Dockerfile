FROM ubuntu

RUN apt-get update && \
    apt-get install -y \
      dante-server \
      openjdk-21-jdk-headless \
      openssh-server \
      python3 \
      sshuttle \
    && \
    apt-get clean && \
    mkdir /var/run/sshd && \
    useradd -m -s /bin/bash user && echo "user:password" | chpasswd && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
COPY danted.conf /etc/danted.conf

# Expose SSH port
EXPOSE 22 1080

# Start the SSH service
CMD ["/usr/sbin/sshd", "-D"]