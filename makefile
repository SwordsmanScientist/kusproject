CC=gcc
CFLAGS= -m32 -g
OBJ= project.o

all: runfile

project.o: project.s $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

runfile: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)