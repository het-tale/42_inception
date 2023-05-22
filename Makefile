# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: het-tale <het-tale@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/12 13:52:08 by het-tale          #+#    #+#              #
#    Updated: 2023/05/19 01:52:23 by het-tale         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


all : up

up : 
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up

down : 
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env down

stop : 
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env start

status : 
	@docker ps
prune :
	@docker system prune -a -f
re: stop prune up