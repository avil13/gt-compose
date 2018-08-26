#!/usr/bin/env bash

set -ex

mkdir -p $RBENV_ROOT
curl -Ls https://github.com/rbenv/rbenv/archive/v$RBENV_VER.tar.gz | tar xz --strip 1 -C $RBENV_ROOT

mkdir $RBENV_ROOT/plugins

mkdir $RBENV_ROOT/plugins/ruby-build
curl -Ls https://github.com/rbenv/ruby-build/archive/v$RUBY_BUILD_VER.tar.gz | tar xz --strip 1 -C $RBENV_ROOT/plugins/ruby-build

mkdir $RBENV_ROOT/plugins/rbenv-gemset
curl -Ls https://github.com/jf/rbenv-gemset/archive/v$RBENV_GEMSET_VER.tar.gz | tar xz --strip 1 -C $RBENV_ROOT/plugins/rbenv-gemset

mkdir $RBENV_ROOT/plugins/rbenv-vars
curl -Ls https://github.com/rbenv/rbenv-vars/archive/v$RBENV_VARS_VER.tar.gz | tar xz --strip 1 -C $RBENV_ROOT/plugins/rbenv-vars

PATH=$RBENV_ROOT/bin:$PATH
echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
echo 'eval "$(rbenv init -)"' >> .bashrc

rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION

ruby -v

gem update --system