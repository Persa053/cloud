FROM ubuntu:20.04

# defaut vars
ENV db_host=db \
    db_database=swap \
    db_pass=12345 \
    db_user=user \
    SEED=false

RUN apt-get update && \
    apt-get install -y software-properties-common 
RUN add-apt-repository ppa:ondrej/php
RUN apt update
RUN apt install -y php7.4 \
    php7.4-fpm \ 
    php7.4-zip \
    php7.4-mbstring \
    php7.4-tokenizer \
    php7.4-mysql \
    php7.4-gd \
    php7.4-xml \
    php7.4-bcmath \
    php7.4-intl \ 
    php7.4-curl \
    nodejs \ 
    composer \
    npm 
RUN git clone https://github.com/Hackathonners/swap.git
WORKDIR /swap
#COPY .env.example .env
RUN cp .env.example .env
RUN composer install
RUN npm install
RUN sed -i s/^DB_HOST=127.0.0.1$/DB_HOST=${db_host}/g .env
RUN sed -i s/^DB_DATABASE=homestead$/DB_DATABASE=${db_database}/g .env
RUN sed -i s/^DB_USERNAME=homestead$/DB_USERNAME=${db_user}/g .env
RUN sed -i s/^DB_PASSWORD=secret$/DB_PASSWORD=${db_pass}/g .env
RUN php artisan key:generate
COPY run_script.sh run_script.sh
RUN chmod u+x run_script.sh
EXPOSE 8000

CMD ./run_script.sh


# fazer var de ambiente para o IP
# ver o que fazer pra não ficar estático
# fazer seed opcional
# ---
# COMANDO PRA CRIAR A REDE:
# docker network create test
# COMANDO PRA CORRER CONTAINER COM MYSQL:
# docker run --name db --net test -p 3306:3306 -d -e MYSQL_USER=user -e MYSQL_PASSWORD=12345 -e MYSQL_DATABASE=swap -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:latest
# COMANDO PRA FAZER BUILD
# docker build . -t swap
# COMANDO PRA CORRER CONTAINER COM SWAP:
# docker run --net test -p 8000:8000 --name swap swap
