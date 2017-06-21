DOCKERFILES_SRC:=template/Dockerfile

DOCKERFILES:= \
	19/Dockerfile \
	19/onbuild/Dockerfile \
	19/development/Dockerfile \
	19/alpine/Dockerfile \
	19/alpine/onbuild/Dockerfile \
	19/alpine/development/Dockerfile

.PHONY: all
all: ${DOCKERFILES}

$(DOCKERFILES): template/Dockerfile 19/options
	bash template/generate.sh $(shell echo $@ | cut -d '/' -f1)/options $< > $@

.PHONY: clean
clean:
	-rm $(DOCKERFILES)
