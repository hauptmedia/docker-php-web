FROM	hauptmedia/php:5.6

ENV     DEBIAN_FRONTEND noninteractive

RUN     apt-get update -qq && \
        apt-get install -y \
        apache2 php5 && \
        apt-get clean autoclean && \
        apt-get autoremove --yes && \
        rm -rf /var/lib/{apt,dpkg,cache,log}/

