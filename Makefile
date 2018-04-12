# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fsabatie <fsabatie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/07 17:18:12 by fsabatie          #+#    #+#              #
#    Updated: 2018/04/12 13:16:58 by acouturi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY : all clean fclean re

# Defining colors

RED = \033[1;31m
GREEN = \033[0;32m
ORANGE = \033[0;33m
BLUE = \033[1;36m
YELLOW = \033[1;33m
PURPLE = \033[1;35m
RESET = \033[0m

# Defining variables

NAME = lem-in
LIB_NAME = libft.a
LIB_PATH = ./libft
FILL_SRCS = ../srcs
BUILD_PATH = build

FILL_SRC_F =	lem_in.c parser.c rooms.c paths.c v_ants.c checkers.c

OBJ_NAME = $(FILL_SRC_F:.c=.o)
OBJS = $(addprefix $(BUILD_PATH)/,$(OBJ_NAME))
SRCS = $(addprefix $(FILL_SRCS)/,$(FILL_SRC_F))
LIB = $(addprefix $(LIB_PATH)/,$(LIB_NAME))

# Compilation flags

CC = gcc
CPPFLAGS = -Wall -Wextra -Werror

# Defining rules

all: $(NAME)

lib:
	@make -C $(LIB_PATH)
	@echo "$(GREEN)Successfully compiled libft.$(RESET)"

$(NAME): lib
	@mkdir -p $(BUILD_PATH) && cd $(BUILD_PATH) && $(CC) $(CPPFLAGS) -c $(SRCS)
	@$(CC) $(CPPFLAGS) -o $(NAME) $(OBJS) $(LIB)
	@echo "$(GREEN)Successfully the binary.$(RESET)"

clean:
	@make clean -C $(LIB_PATH)
	@rm -rf $(BUILD_PATH)

fclean: clean
	@make fclean -C $(LIB_PATH)
	@rm -rf $(NAME)

re: fclean all

test: lib
	@gcc test.c $(LIB) -o main
	@./main
