# Compiler settings
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g
LDFLAGS = -lsfml-graphics -lsfml-window -lsfml-system

# Directories
SRC_DIR = src
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj
BIN_DIR = $(BUILD_DIR)/bin

# Source and object files
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

# Output executable
EXEC = $(BIN_DIR)/game

# Default target
all: $(EXEC)

# Build the executable
$(EXEC): $(OBJS)
	@mkdir -p $(BIN_DIR)  # Ensure bin directory exists
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(EXEC) $(LDFLAGS)

# Rule for compiling source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)  # Ensure obj directory exists
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up object files and executable
clean:
	rm -rf $(BUILD_DIR)

# Rebuild the project (clean + build)
rebuild: clean all

# Run the program
run: $(EXEC)
	./$(EXEC)

# Make sure to always get the dependencies first
.PHONY: all clean rebuild run

