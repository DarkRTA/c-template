CC      := cc
CFLAGS  := -Isrc -Ideps -I. -MMD
LDFLAGS := 

OBJ = $(patsubst %.c,obj/%.o,$(shell find src deps -type f -name *.c))
DEPS = $(patsubst %.o,%.d,$(OBJ))

.PHONY: clean all tags
.SUFFIXES:

S=@

all: main

clean: 
	@rm -rfv obj main

tags:
	@ctags --totals=yes --c-kinds=+defghlmpstuvxz -R \
		src/** \
		deps/**

obj/%.o: %.c obj/%.d
	@echo "CC   "$<
	@mkdir -p $(shell dirname $@)
	$S$(CC) -c -o $@ $< $(CFLAGS)

$(DEPS):

include $(DEPS)

main: $(OBJ)
	@echo "LINK "$@
	$S$(CC) -o $@ $(OBJ) $(LDFLAGS)
