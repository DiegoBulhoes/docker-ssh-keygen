# docker-ssh-keygen

Container criado a parir da imgem do [exemplo sshd](https://docs.docker.com/engine/examples/running_ssh_service/) do Docker Hub com o propósito de criar um usuário, senha e uma chave pública e privada.

```
docker run -d -p 8022:22 diegobulhoes/docker-ssh-keygen
```
