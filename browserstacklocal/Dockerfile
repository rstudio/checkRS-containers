FROM ubuntu:bionic-20180526
MAINTAINER RStudio Quality <qa@rstudio.com>

RUN set -ex; \
        \
        buildDeps=" \
            ca-certificates \
            unzip \
            wget \
        "; \
        \
        apt-get update; \
        apt-get install -y $buildDeps --no-install-recommends; \
        rm -rf /var/lib/apt/lists/*; \
        \
        wget -O /tmp/BrowserStackLocal-linux-x64.zip https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-x64.zip; \
        unzip /tmp/BrowserStackLocal-linux-x64.zip -d /usr/local/bin/; \
        rm /tmp/BrowserStackLocal-linux-x64.zip; \
        \
        apt-get purge -y --auto-remove $buildDeps;

ENTRYPOINT ["/usr/local/bin/BrowserStackLocal"]
