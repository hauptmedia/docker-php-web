FROM	hauptmedia/php:5.6

ENV     DEBIAN_FRONTEND noninteractive

RUN     apt-get update -qq && \
        apt-get install -y \
        nginx php5-fpm supervisor && \
        apt-get clean autoclean && \
        apt-get autoremove --yes && \
        rm -rf /var/lib/{apt,dpkg,cache,log}/

# configure nginx
RUN     echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
        rm /etc/nginx/sites-enabled/*

# configure php5-fpm
RUN     sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini && \
        sed -i '/^listen = /clisten = 0.0.0.0:9000' /etc/php5/fpm/pool.d/www.conf && \
        sed -i '/^listen.allowed_clients/c;listen.allowed_clients =' /etc/php5/fpm/pool.d/www.conf && \
        sed -i '/^;catch_workers_output/ccatch_workers_output = yes' /etc/php5/fpm/pool.d/www.conf

# add supervisord config
ADD	./supervisord.conf  /etc/supervisor/conf.d/supervisord.conf

CMD	["/usr/bin/supervisord"]
