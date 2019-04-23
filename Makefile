CC=g++
CFLAGS = -std=c++17

DEPS = scripts/*/*.h

SRCS = $(shell find -name *.cpp)
OBJS := $(addsuffix .o,$(basename $(SRCS)))

all: run

scripts/persistence/%.o: scripts/persistence/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

scripts/structs/%.o: scripts/structs/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

scripts/main/%.o: scripts/main/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

scripts/%.o: scripts/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

run: $(OBJS)
	$(CC) -o $@ $^ 

clean: 
	rm -rf scripts/persistence/*.o
	rm -rf scripts/structs/*.o
	rm -rf scripts/main/*.o
	rm -rf scripts/*.o
	rm -f run