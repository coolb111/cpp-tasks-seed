CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -Wpedantic

all: demo

demo: sort_demo.cpp
	$(CXX) $(CXXFLAGS) sort_demo.cpp -o demo

test: sort_test.cpp
	$(CXX) $(CXXFLAGS) sort_test.cpp -lgtest -lgtest_main -pthread -o test
	./test

release: demo test

debug: CXXFLAGS += -g -O0
debug: demo test

depends:

tidy:

astyle:
	astyle --options=../astyle.ini *.h *.cpp

clean:
	rm -f demo test