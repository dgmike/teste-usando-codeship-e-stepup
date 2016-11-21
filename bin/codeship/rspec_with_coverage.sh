#!/usr/bin/env bash

set -ex

rm -rf coverage

declare BUNDLE='./bin/bundle exec'
declare RSPEC="${BUNDLE} rspec"

for PATH_NAME in `find spec -type d -depth 1`
do
    COVERAGE_PATH="${PWD}/coverage/$(basename $PATH_NAME)" $RSPEC $PATH_NAME
done

$BUNDLE ruby ${PWD}/bin/codeship/merge-coverage-for-codeclimate.rb

# cp coverage/merged/.resultset.json coverage/.resultset.json

# export CODECLIMATE_REPO_TOKEN=$CODECLIMATE_TOKEN
# $BUNDLE codeclimate-test-reporter
