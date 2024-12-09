JASMIN=~/jasmin/compiler/_build/install/default/bin/jasminc
JFLAGS=-arch arm-m4 -lazy-regalloc

#include jadem4ci/install/jadem4bsp-mps2-an386.mk
#TARGET_CFLAGS += -Icommon

#%.c.o: %.c 
#arm-none-eabi-gcc $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) -c $< -o $@

#%.s.o: %.s 
#arm-none-eabi-gcc $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) -c $< -o $@

#main: main.c.o arithmetic.s.o common/jasmin_syscall.c.o
#arm-none-eabi-gcc $(TARGET_LDFLAGS) $(TARGET_LDLIBS) $^ -o $@

all: arithmetic.s

%.s: %.jazz
	$(JASMIN) $(JFLAGS) -o $@ $<

.PHONY: clean

clean:
	-@rm -f arithmetic.s
#-rm main arithmetic.s.o main.c.o arithmetic.s

.SECONDARY: