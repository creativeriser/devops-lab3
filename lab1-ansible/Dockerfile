
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y openssh-server python3 sudo \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /run/sshd \
 && useradd -m -s /bin/bash devops \
 && echo "devops:devops" | chpasswd \
 && echo "devops ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/devops \
 && mkdir -p /home/devops/.ssh
COPY lab_key.pub /home/devops/.ssh/authorized_keys
RUN chown -R devops:devops /home/devops/.ssh \
 && chmod 700 /home/devops/.ssh && chmod 600 /home/devops/.ssh/authorized_keys
EXPOSE 22 80
CMD ["/usr/sbin/sshd", "-D"]
    