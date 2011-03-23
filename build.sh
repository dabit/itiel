#! /bin/bash -e

source "$HOME/.rvm/scripts/rvm"
rvm 1.9.2
rvm gemset create itiel
rvm use 1.9.2@itiel
bundle -v || gem install bundler
bundle install
rake

