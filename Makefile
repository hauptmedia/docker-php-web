.PHONY: all 5.6-apache-sapi 7.0-apache-sapi 5.6-nginx-fpm 7.1-nginx-fpm

7.1-nginx-fpm:
	docker build -t hauptmedia/php-web:7.1-nginx-fpm 7.1-nginx-fpm

7.0-apache-sapi:
	docker build -t hauptmedia/php-web:7.0-apache-sapi 7.0-apache-sapi

5.6-apache-sapi:
	docker build -t hauptmedia/php-web:5.6-apache-sapi 5.6-apache-sapi

5.6-nginx-fpm:
	docker build -t hauptmedia/php-web:5.6-nginx-fpm 5.6-nginx-fpm

