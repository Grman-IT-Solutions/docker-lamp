FROM tutum/lamp:latest
MAINTAINER Peter Grman <peter.grman@grman.at>

RUN apt-get update && \
  apt-get -y install php5-gd php5-imagick imagemagick graphicsmagick

EXPOSE 80 3306
CMD ["/run.sh"]