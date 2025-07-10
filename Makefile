
DC=docker-compose
NAME=inception
COMPOSEPATH=./src/docker-compose.yaml
all:
	$(DC) -f $(COMPOSEPATH) -p $(NAME) build 
	@make up
up:
	$(DC) -f $(COMPOSEPATH) up -d 

down:
	$(DC) -f $(COMPOSEPATH) down -v
fclean: down
	docker container prune

re: down up

hardre: fclean all 

.PHONY: down up fclean all re
