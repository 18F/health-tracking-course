#!/bin/bash
set -e
set -u
set -o pipefail

# Possible flags on the command line
build_flag=''
serve_flag=''

# Functions invoked by flags
function build () {
    pushd /site || exit
    bundle config set --local path 'vendor/bundle'
    bundle add jekyll --version "~> 4.2"
    bundle exec jekyll build
    exit $?
}

function serve () {
    pushd /site || exit
    bundle config set --local path 'vendor/bundle'
    bundle add jekyll --version "~> 4.2"
    bundle exec jekyll serve --incremental --host 0.0.0.0
    exit $?
}

function print_usage () {
    echo "Usage:"
    echo "\t-b\t\tBuild the site. Leaves output in _site."
    echo "\t-s\t\tServe the site. Visit at the exposed port."
}

# Process the flags
while getopts ':bs' flag; do
    case "${flag}" in
        b)  build_flag='true'
            ;;
        s)  serve_flag='true'
            ;;
        *)  usage >&2
            print_usage
            exit 1 ;;
    esac
done

# Take action based on flags.
if [[ $build_flag == 'true' ]]; then
    build;
    exit 0;
fi
if [[ $serve_flag == 'true' ]]; then
    serve;
    exit 0;
fi


# Should never get here.
echo "ERROR. Likely misuse of container."