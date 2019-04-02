all: tew browserstacklocal deploy

tew:
	docker build -t rstudio/checkrs-tew tew

browserstacklocal:
	docker build -t rstudio/checkrs-browserstacklocal browserstacklocal

deploy:
	docker build -t rstudio/checkrs-deploy deploy

clean:

distclean: clean

test:

.PHONY: all browserstacklocal clean deploy distclean test tew
