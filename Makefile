all:
		@sudo mkdir -p  /home/$(USER)/data
		@sudo mkdir -p /home/$(USER)/data/db
		@sudo mkdir -p /home/$(USER)/data/wp
		@sudo docker-compose -f srcs/docker-compose.yml up -d --build
up:
		@sudo mkdir  /home/$(USER)/data
		@sudo mkdir /home/$(USER)/data/db
		@sudo mkdir /home/$(USER)/data/wp
		@docker-compose -f srcs/docker-compose.yml up -d
down:
		@sudo docker-compose -f srcs/docker-compose.yml down

status:		@sudo docker ps


clean:
		@sudo rm -rf /home/$(USER)/data
		@sudo docker volume rm db wp
fclean:clean
		@sudo docker system prune -af

re:down clean all
