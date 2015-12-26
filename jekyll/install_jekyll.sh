# Installing Jekyll
#
# To install jekyll and all of its dependencies, *source* this shell script.
# Note that this script won't work if you don't source it.

# dependencies
sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev nodejs

# rbenv (https://github.com/rbenv/rbenv#installation)
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_path
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# ruby-build (https://github.com/rbenv/ruby-build#installation)
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# ruby 2.2.4
rbenv install -v 2.3.0
rbenv global 2.3.0

# mwhittaker.github.io
git clone git@github.com:mwhittaker/mwhittaker.github.io
cd mwhittaker.github.io
gem install bundler
bundle install
