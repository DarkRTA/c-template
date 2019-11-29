CC      = cc
CFLAGS  = -Isrc -Ideps -I.
LDFLAGS = 

DEPS = Makefile $(shell find src deps -type f -name *.h)

OBJ = $(patsubst %.c,obj/%.o,$(shell find src deps -type f -name *.c))

.PHONY: clean all tags
.SUFFIXES:

all: main

clean: 
	@rm -rfv obj main

tags:
	@ctags --totals=yes --c-kinds=+defghlmpstuvxz -R \
		src/** \
		deps/**

obj/%.o: %.c $(DEPS)
	@echo "CC   "$<
	@mkdir -p $(shell dirname $@)
	@$(CC) -c -o $@ $< $(CFLAGS)

main: $(OBJ)
	@echo "LINK "$@
	@$(CC) -o $@ $(OBJ) $(LDFLAGS)
