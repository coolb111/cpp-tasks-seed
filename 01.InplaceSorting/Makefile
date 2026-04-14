CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -Wpedantic

all: demo

demo: sort_demo.cpp
	$(CXX) $(CXXFLAGS) sort_demo.cpp -o demo

test: sort_test.cpp
	$(CXX) $(CXXFLAGS) sort_test.cpp -lgtest -lgtest_main -pthread -o test

clean:
	rm -f demo test
