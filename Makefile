DOCKERFILES_SRC:=template/Dockerfile

DOCKERFILES:= \
	18/Dockerfile \
	18/onbuild/Dockerfile \
	18/development/Dockerfile \
	18/alpine/Dockerfile \
	18/alpine/onbuild/Dockerfile \
	18/alpine/development/Dockerfile \
	19/Dockerfile \
	19/onbuild/Dockerfile \
	19/development/Dockerfile \
	19/alpine/Dockerfile \
	19/alpine/onbuild/Dockerfile \
	19/alpine/development/Dockerfile

.PHONY: all
all: ${DOCKERFILES}

$(DOCKERFILES): template/Dockerfile 18/options 19/options
	bash template/generate.sh $(shell echo $@ | cut -d '/' -f1)/options $^ > $@

.PHONY: clean
clean:
	-rm $(DOCKERFILES)
