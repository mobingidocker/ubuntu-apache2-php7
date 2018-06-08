FROM ubuntu:16.04

LABEL maintainer="mobingi,Inc."

RUN apt-get update && apt-get install -y --no-install-recommends \
		apache2 \
		software-properties-common \
		supervisor \
	&& apt-get clean \
	&& rm -fr /var/lib/apt/lists/*

RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update && apt-get install -y --no-install-recommends \
		libapache2-mod-php7.0 \
		php7.0 \
		php7.0-bcmath \
		php7.0-cli \
		php7.0-curl \
		php7.0-dev \
		php7.0-gd \
		php7.0-imap \
		php7.0-mbstring \
		php7.0-mcrypt \
		php7.0-mysql \
		php7.0-pgsql \
		php7.0-pspell \
		php7.0-xml \
		php7.0-xmlrpc \
		php-apcu \
		php-memcached \
		php-pear \
		php-redis \
	&& apt-get clean \
	&& rm -fr /var/lib/apt/lists/*

RUN a2enmod rewrite
COPY conf/000-default.conf /etc/apache2/sites-available/000-default.conf

COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY script/run.sh /run.sh
RUN chmod 755 /run.sh

COPY conf/config /config


EXPOSE 80
CMD ["/run.sh"]
