FROM ubuntu:20.04
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*
RUN add-apt-repository ppa:ondrej/php
RUN apt update
RUN apt install php7.4 \
    php7.4-fpm \ 
    php7.4-zIP \
    php7.4-mbstring,php7.4-tokenizer \
    php7.4-mysql \
    php7.4-gd \
    php7.4-xml \
    php7.4-bcmath \
    php7.4-intl \ 
    php7.4-curl
RUN apt install nodejs
RUN apt install composer
RUN apt install npm
RUN git clone https://github.com/Hackathonners/swap.git
WORKDIR /swap
RUN composer install
RUN npm install
COPY .env.example .env
RUN sed -i s/SEARCH_REGEX/REPLACEMENT/g .env
RUN php artisan key:generate
CMD [ "php" , "artisan", "serve", "--host=0.0.0.0"]


