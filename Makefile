JASMIN=~/jasmin/compiler/jasminc
JFLAGS=-arch arm-m4 -lazy-regalloc

all: arithmetic.s

%.s: %.jazz
	$(JASMIN) $(JFLAGS) -o $@ $<

.PHONY: clean

clean:
	-@rm -f arithmetic.s

.SECONDARY: