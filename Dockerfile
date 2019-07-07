FROM ubuntu:18.04

ARG PASSWORD_ROOT=passwordRoot
ARG PASSWORD_USER_SSH=passwordUserSSH
ARG NEW_PASSPHRASE=newPassphrase

RUN apt-get update && \
    apt-get install -y openssh-server && \
    rm -rf /var/lib/apt/list/*

RUN mkdir /var/run/sshd
RUN echo "root:""${PASSWORD_ROOT}" | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN useradd -ms /bin/bash app
RUN echo "app:""${PASSWORD_USER_SSH}" | chpasswd

USER app
RUN mkdir -p /home/app/.ssh && ssh-keygen -q  -f /home/app/.ssh/id_rsa -N '${NEW_PASSPHRASE}'

USER root
RUN mkdir -p /root/.ssh && ssh-keygen -q  -f /root/.ssh/id_rsa -N '${NEW_PASSPHRASE}'

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
