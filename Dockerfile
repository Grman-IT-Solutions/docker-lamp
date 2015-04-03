FROM tutum/lamp:latest
MAINTAINER Peter Grman <peter.grman@grman.at>

RUN apt-get update && \
  	apt-get -y install php5-gd php5-imagick imagemagick graphicsmagick

#Enviornment variables to configure php
ENV PHP_UPLOAD_MAX_FILESIZE 32M
ENV PHP_POST_MAX_SIZE 32M

# set additional resource limits
# max_execution_time = 30     ; Maximum execution time of each script, in seconds
# max_input_time = 60	; Maximum amount of time each script may spend parsing request data
# memory_limit = 8M      ; Maximum amount of memory a script may consume (8MB)

RUN sed -ri -e "s/^max_execution_time.*/max_execution_time = 300/" \
    		-e "s/^max_input_time.*/max_input_time = 120/" \
    		-e "s/^memory_limit.*/memory_limit = 32M/" /etc/php5/apache2/php.ini

EXPOSE 80 3306
CMD ["/run.sh"]