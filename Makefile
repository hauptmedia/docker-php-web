.PHONY: 5.6-apache-sapi 5.6-nginx-fpm
5.6-apache-sapi:
	docker build -t hauptmedia/php:5.6-apache-sapi 5.6-apache-sapi

5.6-nginx-fpm:
	docker build -t hauptmedia/php:5.6-nginx-fpm 5.6-nginx-fpm
