.PHONY: all 5.6-apache-sapi 5.6-nginx-fpm
all: 5.6-apache-sapi 5.6-nginx-fpm

5.6-apache-sapi:
	docker build -t hauptmedia/php-web:5.6-apache-sapi 5.6-apache-sapi

5.6-nginx-fpm:
	docker build -t hauptmedia/php-web:5.6-nginx-fpm 5.6-nginx-fpm

