FROM engagika_node_webserver

# Start as root
USER root

RUN apt-get -y install php \
libapache2-mod-php \
php-common \
php-mbstring \
php-xmlrpc \
php-soap \
php-gd \
php-xml \
php-mysql \
php-cli \
php-zip \
php-memcached

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential libsqlite3-dev ruby-dev
RUN gem install mailcatcher --no-ri --no-rdoc
#RUN mailcatcher --ip 0.0.0.0

RUN apt-get -y install cron
RUN apt-get update
RUN apt-get -y install supervisor

# Project
ENV PROJECT_DIRECTORY=/var/www/html/
ENV PROJECT_NAME=first-app
ENV PROJECT_USERNAME=dev

# Create project user
RUN adduser ${PROJECT_USERNAME} --gecos "" --disabled-password && \
    usermod -aG sudo ${PROJECT_USERNAME} && \
    su - ${PROJECT_USERNAME}

# Apache2
ENV APACHE_SERVERADMIN=admin@localhost
ENV APACHE_SERVERNAME=localhost
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR   /var/run/apache2
ENV APACHE_PID_FILE  /var/run/apache2/apache2.pid

# Setup system timezone
ARG TZ=UTC
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Create apache directory
RUN mkdir -p ${APACHE_RUN_DIR}

COPY vhost.conf /etc/apache2/sites-enabled/vhost.conf
#COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY sample.conf /etc/apache2/sites-available/${PROJECT_NAME}.conf
COPY laravel-worker.conf /etc/supervisor/conf.d/${PROJECT_NAME}-worker.conf
COPY run_service.sh ${APACHE_RUN_DIR}

RUN htpasswd -cb /etc/apache2/.htpasswd nonono t5i8n5h5@

EXPOSE 80

#ENTRYPOINT ["/usr/sbin/apache2", "-D", "FOREGROUND"]
#ENTRYPOINT ["mailcatcher", "--smtp-ip=0.0.0.0", "--http-ip=0.0.0.0", "--foreground"]

CMD .${APACHE_RUN_DIR}/run_service.sh