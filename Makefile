COMPOSE_DEV=HOSTUSER=`id -u`:`id -g` docker-compose -f docker-compose.dev.yml
COMPOSE_RUN_DEV=${COMPOSE_DEV} run --rm
COMPOSE_UP_DEV=${COMPOSE_DEV} up
RUN_NPM=${COMPOSE_RUN_DEV} dev-api npm


start-dependencies:
	${COMPOSE_RUN_DEV} start-dependencies

i:
	${RUN_NPM} i --save $(module)

i-dev:
	${RUN_NPM} i --save-dev $(module)

install:
	${RUN_NPM} ci --production

run:
	${RUN_NPM} $(command)

dev: start-dependencies
	${COMPOSE_UP_DEV} dev-api

up:
	docker-compose up --build -d

down:
	docker-compose down

dev-down:
	${COMPOSE_DEV} down