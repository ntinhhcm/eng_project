FROM engagika_node_webserver

# Start as root
USER root

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install npm

# Setup system timezone
ARG TZ=UTC
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

EXPOSE 3000