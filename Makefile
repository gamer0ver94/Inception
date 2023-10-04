all:
		@mkdir -p /home/$(USER)/data/db
		@mkdir -p /home/$(USER)/data/wp
		@docker compose -f srcs/docker-compose.yml up -d --build
up:
		@docker compose -f srcs/docker-compose.yml up -d --build
down:
		@docker compose -f srcs/docker-compose.yml down

status:		@docker ps

clean:
		@sudo rm -rf /home/$(USER)/data
		@docker volume rm db wp
fclean:	clean
		@docker system prune -af
prune:
		@docker system prune -af

re:	down clean all
