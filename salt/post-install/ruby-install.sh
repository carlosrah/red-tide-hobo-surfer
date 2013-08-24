#!/bin/bash
cd
echo ''
echo 'Installing rbenv...'
git clone git://github.com/sstephenson/rbenv.git .rbenv

echo ''
echo 'rbenv installed'
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
echo 'eval "$(rbenv init -)"' >> ~/.profile
source .profile

echo ''
echo 'Installing ruby build tools...'
git clone https://github.com/sstephenson/ruby-build.git

echo ''
echo 'Ruby build tools installed'
cd ruby-build
sudo ./install.sh

echo ''
echo 'Installing ruby-2.0.0-p247...'
rbenv install 2.0.0-p247

echo ''
echo 'Ruby-2.0.0-p247 installed'
rbenv rehash

echo ''
echo 'Making ruby-2.0.0-p247 global...'
rbenv global 2.0.0-p247
rbenv rehash

echo ''
echo 'Installing bundler...'
gem install bundler

echo ''
echo 'Bundler installed'
rbenv rehash
cd

echo 'Basic Ruby installation complete!'
