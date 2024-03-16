set quiet := true

BIN := 'bundle exec ruby -Ilib bin/patter'

import? 'internal.just'

[private]
help:
    just --list --unsorted

init:
    bundle install

build:
    bundle exec rake build

clean:
    rm -vf pkg/*

install:
    bundle exec rake install

run +args:
    {{ BIN }} {{ args }}

test:
    bundle exec rspec
    echo
    echo o coverage/index.html

lint:
    rubocop

fix:
    rubocop -A

fmt:
    just --fmt
