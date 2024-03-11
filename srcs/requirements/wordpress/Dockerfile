# Use the Debian Buster base image
FROM debian:buster

# Step 2: Install dependencies
RUN     apt update -y && \
        apt-get upgrade -y && \
        apt-get install -y php \
        php-mysql \
        php-cli \
        php-fpm \
        mariadb-client \
        wget

RUN rm -rf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php/

RUN mkdir -p /var/www/html/

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
	
COPY ./tools/conf.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/conf.sh

WORKDIR /var/www/html

CMD [ "/usr/local/bin/conf.sh" ]