FROM ubuntu:16.04


# ENVs
ARG RUBY_VERSION=2.4.1
ENV RUBY_VERSION ${RUBY_VERSION}

ARG RBENV_ROOT=/usr/local/rbenv
ENV RBENV_ROOT ${RBENV_ROOT}

ARG RBENV_VER=1.1.1
ENV RBENV_VER ${RBENV_VER}

ARG RUBY_BUILD_VER=20180424
ENV RUBY_BUILD_VER ${RUBY_BUILD_VER}

ARG RBENV_GEMSET_VER=0.5.9
ENV RBENV_GEMSET_VER ${RBENV_GEMSET_VER}

ARG RBENV_VARS_VER=1.2.0
ENV RBENV_VARS_VER ${RBENV_VARS_VER}

ARG CONFIGURE_OPTS=--disable-install-doc
ENV CONFIGURE_OPTS ${CONFIGURE_OPTS}

ARG PATH=$RBENV_ROOT/bin:$PATH
ENV PATH ${PATH}

######


# USER root
COPY scripts /root/scripts/

RUN apt-get update -yqq && apt-get install -yqq \
    curl \
    git \
    build-essential \
    bzip2 \
    ca-certificates \
    default-jre \
    libpq-dev \
    libreadline-dev \
    libssl-dev \
    wkhtmltopdf \
    zlib1g-dev 
# scripts
RUN /root/scripts/install_ruby.sh && \ 
    /root/scripts/test_installed_versions.sh && \
    rm -rf /root/scripts && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/*


CMD ["bundle", "exec", "./server", "start"]