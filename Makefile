all: tew browserstacklocal

tew:
	docker build -t rstudio/checkrs-tew tew

browserstacklocal:
	docker build -t rstudio/checkrs-browserstacklocal browserstacklocal

clean:

distclean: clean

test:

.PHONY: all
.PHONY: tew
.PHONY: clean
.PHONY: distclean
.PHONY: test
