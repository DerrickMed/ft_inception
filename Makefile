start:
	@
	@docker-compose -f srcs/docker-compose.yaml up
down:
	@docker-compose -f srcs/docker-compose.yaml down
re:	
	@docker-compose -f srcs/docker-compose.yaml up --build
clean: down
	@echo "💥 Removing related folders/files..."
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q)\
