
DC=docker-compose
NAME=inception
COMPOSEPATH=src/docker-compose.yaml

all: check_certiicates
	$(DC) -f $(COMPOSEPATH) -p $(NAME) build 
	@make up

check_certiicates:
	@if [ ! -f ./src/nginx/certs/server.crt ] || [ ! -f ./src/nginx/certs/server.key ]; then \
		echo "Certificates not found. I'll generate them first."; \
		chmod +x ./src/nginx/certi_dummy_gen.sh; \
		./src/nginx/certi_dummy_gen.sh; \
	fi

up:
	$(DC) -f $(COMPOSEPATH) up -d 

down:
	$(DC) -f $(COMPOSEPATH) down -v
fclean: down
	@docker system prune -a -f --volumes
re: down up

hardre: fclean all 

logs:
	$(DC) -f $(COMPOSEPATH) logs -f 
.PHONY: down up fclean all re hardre logs
