# docker-ssh-keygen

Container criado a parir da imgem do [exemplo sshd](https://docs.docker.com/engine/examples/running_ssh_service/) do Docker Hub com o propósito de criar um usuário, senha e uma chave pública e privada.

```
docker run -d -p 8022:22 diegobulhoes/docker-ssh-keygen
```

Você pode especificar a senha do root com a variável de ambiente **PASSWORD_ROOT**, a do usuário app utilizando **PASSWORD_USER_SSH** e da frase de segurança referente a chave de segurança **NEW_PASSPHRASE**. Por padrão essa variável estão armazenando os seguintes valores e o acesso root via ssh esta **bloqueado**

```
PASSWORD_ROOT='passwordRoot'
PASSWORD_USER_SSH='passwordUserSSH'
NEW_PASSPHRASE='new_passphrase'
```
