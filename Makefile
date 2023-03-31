# Makefile
.PHONY: build up down restart logs install-backend install-frontend
build:
	docker-compose build
up:
	docker-compose up -d
down:
	docker compose down --remove-orphans
down-v:
	docker compose down --remove-orphans --volumes
destroy:
	docker compose down --rmi all --volumes --remove-orphans
ps:
	docker compose ps
logs:
	docker compose logs
logs-watch:
	docker compose logs --follow
log-nginx:
	docker compose logs nginx
log-nginx-watch:
	docker compose logs --follow nginx
log-laravel:
	docker compose logs laravel
log-laravel-watch:
	docker compose logs --follow laravel
log-db:
	docker compose logs db
log-db-watch:
	docker compose logs --follow db
nginx:
	docker compose exec nginx bash
laravel:
	docker compose exec laravel bash
restart:
	docker-compose down && docker-compose up -d
install-backend:
	docker-compose exec laravel composer install
install-frontend:
	docker-compose exec vue npm install
migrate:
	docker-compose exec laravel php artisan migrate
rollback:
	docker-compose exec laravel php artisan migrate:rollback
sql:
	docker compose exec db bash -c 'mysql -u $$MYSQL_USER -p$$MYSQL_PASSWORD $$MYSQL_DATABASE'
stop:
	docker compose stop
start:
	docker compose start

# vue container query
vue-build:
	docker compose build vue
vue-create:
	docker compose run --rm vue vue create -n -d .
vue:
	docker compose exec vue bash
vue-app-build:
	docker compose exec vue npm run build
vue-app-serve:
	docker compose exec vue npm run serve
log-vue:
	docker compose logs vue
log-vue-watch:
	docker compose logs --follow vue