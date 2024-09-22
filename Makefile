NAME        := rubiksCube
CC          := c++
FLAGS       := -std=c++11 -I./inc

SRCS        := src/RubiksCube.cpp \
               src/main.cpp \
               src/makeMoves.cpp \
               src/resolutionByLayer.cpp

OBJS_DIR    := resolver
OBJS        := $(SRCS:src/%.cpp=$(OBJS_DIR)/%.o)

$(OBJS_DIR)/%.o: src/%.cpp
	@mkdir -p $(OBJS_DIR)
	${CC} ${FLAGS} -c $< -o $@

CLR_RMV     := \033[0m
RED         := \033[1;31m
GREEN       := \033[1;32m
YELLOW      := \033[1;33m
BLUE        := \033[1;34m
CYAN        := \033[1;36m
RM          := rm -f

${NAME}:    ${OBJS}
			@echo "$(GREEN)Compilation ${CLR_RMV}of ${YELLOW}$(NAME) ${CLR_RMV}..."
			${CC} ${FLAGS} -o ${NAME} ${OBJS}
			@echo "$(GREEN)$(NAME) created\x1b[0m ✔️"

all:        ${NAME}

bonus:      all

clean:
			@ ${RM} $(OBJS_DIR)/*.o
			@ echo "$(RED)Deleting $(CYAN)$(NAME) $(CLR_RMV)objs ✔️"

fclean:     clean
			@ ${RM} ${NAME}
			@ echo "$(RED)Deleting $(CYAN)$(NAME) $(CLR_RMV)binary ✔️"

re:         fclean all

.PHONY:     all clean fclean re
