NAME = inception
PATH_DOCKER_COMPOSE = srcs/docker-compose.yml
LOGIN = pvong
RESET_COLOR = \033[0m

#  === Exported Variables ===
ifeq ($(shell uname),Darwin)
	HOME = /Users/$(LOGIN)
else
	HOME = /home/$(LOGIN)
endif

export PATH_V_WORDPRESS := $(HOME)/data/wordpress
export PATH_V_MARIADB := $(HOME)/data/mariadb


ifeq ($(shell uname),Darwin)
	export STUDENT_DOMAIN = localhost
else
	export STUDENT_DOMAIN = $(LOGIN).42.ch
endif

#  === Rules ===

all : prepare down build run

run:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} up

run-daemon:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} up -d

down:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} down

stop:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} stop

prepare:
	if [ ! -d ${PATH_V_WORDPRESS} ]; then \
		mkdir -p ${PATH_V_WORDPRESS}; \
	fi
	if [ ! -d ${PATH_V_MARIADB} ]; then \
		mkdir -p ${PATH_V_MARIADB}; \
	fi

build:
	docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} build

clean: down
	docker system prune -a

fclean: down
	docker system prune -a --volumes
	docker volume rm $$(docker volume ls -q)
	rm -rf ~/data

re: fclean all

clear:
	-if [ "$$(docker ps -q)" ]; then docker stop $$(docker ps -qa); fi
	-if	[ "$$(docker ps -qa)" ]; then docker rm $$(docker ps -qa); fi
	-if	[ "$$(docker images -q)" ]; then docker rmi -f $$(docker images -qa);	fi
	-if	[ "$$(docker volume ls -q)" ]; then docker volume rm $$(docker volume ls -q); fi
	-if	[ "$$(docker network ls -q)" ]; then docker network rm $$(docker network ls -q) 2>/dev/null; fi

delete-volumes :
	docker system prune -a --volumes
	docker volume rm $$(docker volume ls -q)

status :

	@echo "\033[44mRunning Containers :${RESET_COLOR}"
	@docker-compose -f ${PATH_DOCKER_COMPOSE} -p ${NAME} ps
	@echo ""

	@echo "\033[44mImages :${RESET_COLOR}"
	@docker images
	@echo ""

	@echo "\033[44mContainers :${RESET_COLOR}"
	@docker container ls -a
	@echo ""

	@echo "\033[44mVolumes :${RESET_COLOR}"
	@docker volume ls
	@echo ""

	@echo "\033[44mNetwork :${RESET_COLOR}"
	@docker network ls
	@echo ""


.PHONY: all clean fclean re status stop run run-daemon down build prepare delete-volumes clear