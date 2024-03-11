all:
	sudo docker compose -f ./srcs/docker-compose.yml up -d
down:
	sudo docker compose -f  ./srcs/docker-compose.yml down
clean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v

fclean: clean
	@if [ -d "/home/lbroms/data" ]; then \
		sudo rm -rf /home/lbroms/data/* && \
	echo "fclean succesfull"; \
	fi;

re: fclean all

info:
		@echo "IMAGES"
		@docker images
		@echo
		@echo "CONTAINERS"
		@docker ps -a
		@echo
		@echo "NETWORKS"
		@docker network ls
		@echo
		@echo "VOLUMES"
		@docker volume ls