ARG UUID
ARG USER

FROM php:7.4-fpm

ARG UUID
ENV UUID=${UUID:-3000}

ARG USER
ENV USER=${USER:-bnp}

RUN echo "user is "$USER" with uid "$UUID

RUN apt update \
    && apt install -y zlib1g-dev npm libicu-dev libjpeg62-turbo-dev libpng-dev zip libzip-dev zip libpq-dev \
    && docker-php-ext-install intl opcache pdo pdo_pgsql \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip \
    && docker-php-ext-configure gd --with-jpeg --enable-gd \
    && docker-php-ext-install gd

RUN apt install tzdata
ENV TZ=Europe/Sarajevo
RUN cp /usr/share/zoneinfo/Europe/Sarajevo /etc/localtime

RUN npm install -g sass
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone
#Create user to run Composer and Artisan commands
RUN useradd -G www-data,root -u ${UUID} -d /home/$USER ${USER}
RUN mkdir -p /home/$USER/.composer && \
    chown -R $USER:$USER /home/$USER

RUN rm -rf /var/cache/apk/*

RUN cd /usr/local/etc/php/conf.d/ && \
  echo 'memory_limit = 1024M' >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

RUN chmod 6777 /tmp

USER ${USER}

WORKDIR /var/www/bnp-zenica.com