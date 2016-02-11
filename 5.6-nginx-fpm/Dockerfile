FROM	hauptmedia/php:5.6

ENV     DEBIAN_FRONTEND noninteractive

RUN     echo "deb http://nginx.org/packages/debian/ jessie nginx" >>/etc/apt/sources.list && \
	echo "deb-src http://nginx.org/packages/debian/ jessie nginx" >>/etc/apt/sources.list && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C && \
	apt-get update -qq && \
        apt-get install -y --force-yes \
        nginx php5-fpm supervisor && \
        apt-get clean autoclean && \
        apt-get autoremove --yes && \
        rm -rf /var/lib/{apt,dpkg,cache,log}/

# configure nginx
RUN     echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# configure php5-fpm
RUN     sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini && \
        sed -i '/^listen = /clisten = 0.0.0.0:9000' /etc/php5/fpm/pool.d/www.conf && \
        sed -i '/^listen.allowed_clients/c;listen.allowed_clients =' /etc/php5/fpm/pool.d/www.conf && \
        sed -i '/^;catch_workers_output/ccatch_workers_output = yes' /etc/php5/fpm/pool.d/www.conf

# add supervisord config
ADD	etc/supervisor/conf.d/ /etc/supervisor/conf.d/

ADD	etc/nginx/conf.d/upstream_phpfcgi.conf /etc/nginx/conf.d/upstream_phpfcgi.conf

CMD	["/usr/bin/supervisord"]
