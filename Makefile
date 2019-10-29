# Makefile to build Flex example

all: part1

part1: part1.c part1.h
	gcc -ll part1.c -o part1

part1.c part1.h: part1.lex
	flex part1.lex

# Utility targets
.PHONY: clean test
clean:
	rm -f part1 part1.c part1.h myoutput.txt

test: part1
	./part1 < examples/example.cmm > example.myout
	diff -u examples/example.tokens example.myout
	./part1 < examples/example-err.cmm > example-err.myout || true
	diff -u examples/example-err.tokens example-err.myout

