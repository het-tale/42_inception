# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: het-tale <het-tale@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/12 13:52:08 by het-tale          #+#    #+#              #
#    Updated: 2023/05/16 14:44:35 by het-tale         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


all : up

up : 
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up

down : 
	@docker-compose -f ./srcs/docker-compose.yml down

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env start

status : 
	@docker ps
prune :
	@docker system prune -a
volume :
	@docker volume rm srcs_mariadb srcs_wordpress
re: stop prune up
#delete volume as well