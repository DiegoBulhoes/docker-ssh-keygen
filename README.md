# docker-ssh-keygen

Container criado a parir da imgem do [exemplo sshd](https://docs.docker.com/engine/examples/running_ssh_service/) do Docker Hub com o propósito de criar um usuário, senha e uma chave pública e privada.

```
docker run -d diegobulhoes/docker-ssh-keygen
```

Você pode especificar a senha do root utilizando o argumento  **PASSWORD_ROOT**, a do usuário app utilizando **PASSWORD_USER_SSH** e da frase de segurança referente a chave de segurança **NEW_PASSPHRASE**. Por padrão esses argumentos estão armazenando nos seguintes argumentos.

```
PASSWORD_ROOT='passwordRoot'
PASSWORD_USER_SSH='passwordUserSSH'
NEW_PASSPHRASE='newPassphrase'
```

O acesso root via utilizando a senha **bloqueado**
