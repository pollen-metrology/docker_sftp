# docker build -t pollenm/docker_sftp .
# sftp -oPort=2222 -o StrictHostKeyChecking=no platypus@localhost
# https://github.com/atmoz/sftp
FROM debian:stretch
LABEL MAINTENER Pollen Metrology <admin-team@pollen-metrology.com>

# Steps done in one RUN layer:
# - Install packages
# - OpenSSH needs /var/run/sshd to run
# - Remove generic host keys, entrypoint generates unique keys
RUN apt-get update && \
    apt-get -y install openssh-server && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/sshd && \
    rm -f /etc/ssh/ssh_host_*key*

COPY files/sshd_config /etc/ssh/sshd_config
COPY files/create-sftp-user /usr/local/bin/
COPY files/entrypoint.sh /

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
