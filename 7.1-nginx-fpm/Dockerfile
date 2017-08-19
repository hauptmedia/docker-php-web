FROM	hauptmedia/php:7.1

ENV     DEBIAN_FRONTEND noninteractive

RUN     apt-get update -qq && \
        apt-get install -y --force-yes nginx php7.1-fpm supervisor && \
        apt-get clean autoclean && \
        apt-get autoremove --yes && \
        rm -rf /var/lib/{apt,dpkg,cache,log}/

# configure nginx
RUN     echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# configure php7.1-fpm
RUN     sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.1/fpm/php.ini && \
        sed -i '/^listen = /clisten = 0.0.0.0:9000' /etc/php/7.1/fpm/pool.d/www.conf && \
        sed -i '/^listen.allowed_clients/c;listen.allowed_clients =' /etc/php/7.1/fpm/pool.d/www.conf && \
        sed -i '/^;catch_workers_output/ccatch_workers_output = yes' /etc/php/7.1/fpm/pool.d/www.conf && \
        sed -i '/^pid = \/run\/php\/php7.1-fpm.pid/cpid = \/var\/run\/php7.1-fpm.pid' /etc/php/7.1/fpm/php-fpm.conf && \
        sed -i '/^;clear_env = no/cclear_env = no' /etc/php/7.1/fpm/pool.d/www.conf


# add supervisord config
ADD	etc/supervisor/conf.d/ /etc/supervisor/conf.d/

ADD	etc/nginx/conf.d/upstream_phpfcgi.conf /etc/nginx/conf.d/upstream_phpfcgi.conf

CMD	["/usr/bin/supervisord"]
