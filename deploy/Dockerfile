FROM rocker/r-ver:3.5.3

# install build dependencies
RUN set -ex; \
    \
    export DEBIAN_FRONTEND=noninteractive; \
    \
    buildDeps=" \
        curl \
        libcurl4-openssl-dev \
        libssl-dev \
        libxml2-dev \
        wget \
        zlib1g-dev \
    " ; \
    \
    apt-get update; \
    apt-get install -y $buildDeps --no-install-recommends; \
    rm -rf /var/lib/apt/lists/*;


# install the R package
COPY install_R_packages.R install_R_packages.R
RUN set -ex; \
    Rscript install_R_packages.R; \
    rm install_R_packages.R;
