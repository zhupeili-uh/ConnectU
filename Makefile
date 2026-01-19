# Compiler and flags
CXX = g++
#CXXFLAGS = -Wall -Wextra -std=c++17 -O2
CXXFLAGS = -std=c++17 -O2
# Debug flags (uncomment for debugging)
# CXXFLAGS = -Wall -Wextra -std=c++17 -g -O0

# Program name
TARGET = connectu

# Source files
SRCS = connectu.cpp
# Object files (automatically generated from source files)
OBJS = $(SRCS:.cpp=.o)

# Default target
all: $(TARGET)

# Link object files to create executable
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

# Compile source files to object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean build artifacts
clean:
	rm -f $(TARGET) $(OBJS)

# Run the program
run: $(TARGET)
	./$(TARGET)

# Debug target
debug: CXXFLAGS += -g -O0
debug: clean $(TARGET)

# Phony targets
.PHONY: all clean run debug