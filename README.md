# docker-lamp
Based on [tutum/lamp](https://registry.hub.docker.com/u/tutum/lamp/) with php5-gd installed (necessary for instance for [typo3](http://typo3.org/)). Exact list of additional packages installed:

- php5-gd
- php5-imagick
- imagemagick
- graphicsmagick

Additional changes performed, changed following PHP Configurations to following new values:

- php_upload_max_filesize: 64M
- php_post_max_size: 64M
- max_execution_time: 300 (seconds)
- max_input_time: 120 (seconds)
- memory_limit: 128M

Changes in Apache:

- .htaccess: AllowOverride set to All