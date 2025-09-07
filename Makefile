CC=gcc
CFLAGS=

SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)
OUT=spoon

all: $(OUT)

$(OUT): $(OBJS)
	$(CC) -o $(OUT) $(OBJS)

$(OBJS): $(SRCS)
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	rm -f $(OUT) $(OBJS)
