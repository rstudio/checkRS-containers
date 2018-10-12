all: tew

tew:
	docker build -t rstudio/tew tew

clean:

distclean: clean

test:

.PHONY: all
.PHONY: tew
.PHONY: clean
.PHONY: distclean
.PHONY: test
