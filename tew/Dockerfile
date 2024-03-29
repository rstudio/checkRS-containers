FROM ubuntu:bionic-20190807
MAINTAINER RStudio Quality <qa@rstudio.com>

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# No interactive frontend during docker build
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

# Install basic development & debugging tools
RUN set -ex; \
    \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        bash \
        curl \
        jq \
        libnss-wrapper \
        make \
        openssh-server \
        sudo \
        vim \
        wget; \
    \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*;


# Copy in Python package requirements files
WORKDIR /opt/work
COPY Pipfile Pipfile.lock /opt/work/

# Install build dependencies and Python packages
# these build dependencies are only needed to compile
# Python packages. After installing the packages,
# purge them to keep the final layer small.
RUN set -ex; \
    \
    buildDeps=" \
        gcc \
        git \
        libc6-dev \
        libffi-dev \
        libssl-dev \
    "; \
    \
    pythonPkgs=" \
        ipython3 \
        python3 \
        python3-dev \
        python3-pip \
    "; \
    \
    apt-get update; \
    apt-get install -y $buildDeps $pythonPkgs --no-install-recommends; \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*; \
    \
    ln -s /usr/bin/python3 /usr/bin/python; \
    ln -s /usr/bin/pydoc3 /usr/bin/pydoc; \
    \
    python3 -m pip install --no-cache-dir pipenv; \
    pipenv install --system --dev --pre; \
    rm -f Pipfile Pipfile.lock; \
    \
    apt-get purge -y --auto-remove $buildDeps;


# Prevent python from creating .pyc files and __pycache__ dirs
ENV PYTHONDONTWRITEBYTECODE=1


# Show stdout when running in docker compose (dont buffer)
ENV PYTHONUNBUFFERED=1


# Add a python startup file
COPY pystartup /usr/local/share/python/pystartup
ENV PYTHONSTARTUP=/usr/local/share/python/pystartup


# command line setup
# do minimal setup so we can be semi-efficient when using
# the command line of the container. Without PS1, we will
# get a prompt like "I have no name!@<container_id_hash>:/$"
# since we don't create a user or group.
RUN set -ex; \
    echo "PS1='\h:\w\$ '" >> /etc/bash.bashrc; \
    echo "alias ls='ls --color=auto'" >> /etc/bash.bashrc; \
    echo "alias grep='grep --color=auto'" >> /etc/bash.bashrc;


# Create user named "docker" with no password
RUN useradd --create-home --shell /bin/bash docker \
    && passwd docker -d \
    && adduser docker sudo

# Don't require a password for sudo
RUN sed -i 's/^\(%sudo.*\)ALL$/\1NOPASSWD:ALL/' /etc/sudoers

# set an entrypoint script that allows us to
# dynamically change the uid/gid of the container's user
COPY entry_point.sh /opt/bin/
ENTRYPOINT ["/opt/bin/entry_point.sh"]
CMD ["/opt/bin/entry_point.sh"]
