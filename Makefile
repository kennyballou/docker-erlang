DOCKERFILES_SRC:=template/Dockerfile

DOCKERFILES:= \
	19/Dockerfile \
	19/onbuild/Dockerfile \
	19/development/Dockerfile \
	19/alpine/Dockerfile \
	19/alpine/onbuild/Dockerfile \
	19/alpine/development/Dockerfile \
	20/Dockerfile \
	20/onbuild/Dockerfile \
	20/development/Dockerfile \
	20/alpine/Dockerfile \
	20/alpine/onbuild/Dockerfile \
	20/alpine/development/Dockerfile \

.PHONY: all
all: ${DOCKERFILES}

$(DOCKERFILES): template/Dockerfile 19/options 20/options
	mkdir -p $(@D)
	bash template/generate.sh $(shell echo $@ | cut -d '/' -f1)/options $< > $@

.PHONY: clean
clean:
	-rm $(DOCKERFILES)
