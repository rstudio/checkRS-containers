# checkRS-tew
Configuration files for the *tew* (test environment: web) containerized test environment.

### Quick Tips

This directory depends on [pyenv](https://github.com/pyenv/pyenv) for local testing of configuration files and [pipenv](https://github.com/pypa/pipenv) for Python package management.

#### Installing pyenv

Follow the instructions found on the pyenv project's website, https://github.com/pyenv/pyenv#installation or try the curl based, one script install described [here](https://github.com/pyenv/pyenv-installer#prerequisites)

#### Setting up pyenv

Creating the pyenv environment:

```
pyenv virtualenv 3.6.8 checkrs-tew
pyenv local checkrs-tew
```

We use python version 3.6.8 because that is the version used inside of the Docker image we are targeting (ubuntu:bionic-20190526) at the time of writing.

#### Installing pipenv

Use `pip` to install pipenv:
```
pip install -U pipenv
```

#### Install the packages from the Pipfile and Pipfile.lock

Pipfile and Pipfile.lock are artifacts of pipenv. They hold detailed information about the versions and SHA256 hashes of packages. Use the following command to install packages into your local pyenv based Python environment:

```
pipenv install --dev
```

#### Adding new packages to Pipfile and Pipfile.lock

New packages can be added to the Pipfiles with a command like this:

```
pipenv install packagename
```

Where `packagename` is the name of the package you want to install


### Building the Docker image

Use the Makefile at the top of the repository to build a new Docker image:

```
make tew
```
