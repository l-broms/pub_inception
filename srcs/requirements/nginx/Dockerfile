FROM	debian:buster

RUN	apt-get update
RUN	apt-get install -y nginx && apt-get install -y openssl
RUN mkdir -m 775 /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/lbroms.crt \
       -keyout /etc/nginx/ssl/lbroms.key \
       -subj "/C=FI/ST=Helsinki/L=Helsinki/O=Hive/OU=lbroms/CN=lbroms/"

COPY ./conf/default.conf /etc/nginx/sites-available/default.conf
COPY ./conf/default.conf /etc/nginx/sites-enabled/default.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf


EXPOSE	443

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
