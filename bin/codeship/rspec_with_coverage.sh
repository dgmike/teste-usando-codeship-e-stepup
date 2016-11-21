#!/usr/bin/env bash

set -e

rm -rf coverage

declare BUNDLE='./bin/bundle exec'
declare RSPEC="${BUNDLE} rspec"

for PATH_NAME in `find spec -type d -depth 1`
do
    COVERAGE_PATH="${PWD}/coverage/$(basename $PATH_NAME)" $RSPEC $PATH_NAME
done

$BUNDLE ruby ${PWD}/bin/codeship/merge-coverage-for-codeclimate.rb
