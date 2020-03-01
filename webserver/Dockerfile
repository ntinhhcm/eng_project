FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade
RUN apt-get -y install apache2 apache2-utils
RUN apt-get -y install curl
RUN apt-get -y install nodejs
RUN apt-get -y install sudo wget vim telnet zip unzip mlocate composer
RUN apt-get -y install cron

# Enable apache rewrite mode
RUN a2enmod rewrite