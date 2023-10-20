### Comandos:
## Docker

### Criar a rede
```bash
docker network create <NOME DA REDE>
```
### Ver as redes existentes
```bash
docker network list
```
### Entrar no container
```bash
docker exec -ti <NOME DO CONTAINER> /bin/sh
```
### Build do Dockerfile
```bash
docker build . -t <NOME DA IMAGE>
```
### Criar o container do MYSQL
```bash
docker run --name db --net test -p 3306:3306 -d -e MYSQL_USER=user \
-e MYSQL_PASSWORD=12345 -e MYSQL_DATABASE=swap -e \MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:latest
```
### Correr o container do swap
```bash
docker run --net <NOME DA REDE> -p 8000:8000 \
--name <NOME DO CONTAINER> <NOME DA IMAGE>
```
