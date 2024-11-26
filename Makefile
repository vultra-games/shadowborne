CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g
LDFLAGS = -lsfml-graphics -lsfml-window -lsfml-system

SRC_DIR = src
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj
BIN_DIR = $(BUILD_DIR)/bin

SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

EXEC = $(BIN_DIR)/game

all: $(EXEC)

$(EXEC): $(OBJS)
	@mkdir -p $(BIN_DIR)  
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(EXEC) $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)  
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

rebuild: clean all

run: $(EXEC)
	./$(EXEC)

.PHONY: all clean rebuild run

