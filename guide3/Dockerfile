FROM ubuntu:20.04
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*
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
    php7.4-curl
RUN apt install nodejs -y
RUN apt install composer -y
RUN apt install npm -y
RUN git clone https://github.com/Hackathonners/swap.git
WORKDIR /swap
#COPY .env.example .env
RUN cp .env.example .env
RUN composer install
RUN npm install
RUN sed -i s/^DB_HOST=127.0.0.1$/DB_HOST=${sql}/g .env
RUN sed -i s/^DB_DATABASE=homestead$/DB_DATABASE=swap/g .env
RUN sed -i s/^DB_USERNAME=homestead$/DB_USERNAME=swap/g .env
RUN sed -i s/^DB_PASSWORD=secret$/DB_PASSWORD=12345/g .env
RUN php artisan key:generate
RUN php artisan migrate
#RUN php artisan db:seed
EXPOSE 8000

CMD [ "php" , "artisan", "serve", "--host=0.0.0.0"]


# fazer var de ambiente para o IP
# ver o que fazer pra não ficar estático
# fazer seed opcional
# ---
# COMANDO PRA CORRER CONTAINER COM MYSQL:
# docker run --name sql --net test -p 3306:3306 -d -e MYSQL_USER=swap -e MYSQL_PASSWORD=12345 -e MYSQL_DATABASE=swap -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:latest
# COMANDO PRA CORRER CONTAINER COM SWAP:
# docker run --net test -p 8000:8000 --name swap swap
