all:
		@sudo mkdir -p  volumes
		@sudo mkdir -p volumes/db
		@sudo mkdir -p volumes/wp
		@sudo docker-compose -f srcs/docker-compose.yml up -d --build
up:
		@sudo mkdir  volumes
		@sudo mkdir volumes/db
		@sudo mkdir volumes/wp
		@docker-compose -f srcs/docker-compose.yml up -d
down:
		@sudo docker-compose -f srcs/docker-compose.yml down

status:		@sudo docker ps


clean:
		@sudo rm -rf volumes
		@sudo docker volume rm db wp
fclean:clean
		@sudo docker system prune -af

re:down clean all
