FROM debian:buster

RUN apt-get update -y && apt-get install mariadb-server mariadb-client -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/init.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/init.sh

RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD ["/usr/local/bin/init.sh"]
