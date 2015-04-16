FROM tutum/lamp:latest
MAINTAINER Peter Grman <peter.grman@grman.at>

RUN apt-get update && \
  	apt-get -y install php5-gd php5-imagick php5-mcrypt php5-imap php5-memcache php5-curl \
                       imagemagick graphicsmagick && \
    php5enmod mcrypt imap

#Enviornment variables to configure php
ENV PHP_UPLOAD_MAX_FILESIZE 64M
ENV PHP_POST_MAX_SIZE 64M

# set additional resource limits
# max_execution_time = 30     ; Maximum execution time of each script, in seconds
# max_input_time = 60	; Maximum amount of time each script may spend parsing request data
# memory_limit = 8M      ; Maximum amount of memory a script may consume (8MB)

RUN sed -ri -e "s/^max_execution_time.*/max_execution_time = 600/" \
    		-e "s/^max_input_time.*/max_input_time = 300/" \
    		-e "s/^memory_limit.*/memory_limit = 256M/" /etc/php5/apache2/php.ini

# config to enable .htaccess
ADD apache_default /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

EXPOSE 80 3306
CMD ["/run.sh"]