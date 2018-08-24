#!/usr/bin/env bash

set -ex

source /etc/profile.d/rbenv.sh
rbenv global $RUBY_VERSION
ruby -v

psql --version
crowdin --version
java -version
wkhtmltopdf --version
