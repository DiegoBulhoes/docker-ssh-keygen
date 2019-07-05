FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y openssh-server && \
    rm -rf /var/lib/apt/list/*

ENV PASSWORD_ROOT='passwordRoot'
ENV PASSWORD_USER_SSH='passwordUserSSH'
ENV NEW_PASSPHRASE='new_passphrase'

RUN mkdir /var/run/sshd
RUN echo 'root:${PASSWORD_ROOT}' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN useradd -ms /bin/bash app
RUN echo 'app:${PASSWORD_USER_SSH}' | chpasswd
RUN mkdir -p /home/app/.ssh && ssh-keygen -q  -f /home/app/.ssh/id_rsa -N '${NEW_PASSPHRASE}'

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
