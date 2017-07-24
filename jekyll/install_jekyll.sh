#! /bin/bash

# For information on how to use Jekyll with GitHub pages, refer to
# https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/

main() {
    git clone git@github.com:mwhittaker/mwhittaker.github.io
    cd mwhittaker.github.io
    gem install jekyll bundler
    bundle install
    bundle update
}

main
