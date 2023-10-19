CC=gcc
RM=rm

CFLAGS=-c -Wall
LDFLAGS=

DESTDIR=
BINDIR=/usr/bin

SOURCES=hello.c helloprint.c
OBJECTS=$(SOURCES:.c=.o)

EXECUTABLE=hellomake

#DEBUG ?= 0

#ifeq ($(DEBUG),1)
#CFLAGS += -g
#endif

.cpp: .o
	$(CC) $(CFLAGS) $< -o $@

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $^ -o $@

clean:
	$(RM) -f $(EXECUTABLE) *.o

install: $(EXECUTABLE)
	mkdir -p $(DESTDIR)/$(BINDIR)
	install -m 0755 $< $(DESTDIR)/$(BINDIR)
