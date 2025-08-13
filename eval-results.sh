#!/usr/bin/env sh
set -x
set -e
export PATH=".:$PATH"
rm -f found-*.txt
parallel eval-results-helper -- results/*.xml
wc -l found-*.txt
date

