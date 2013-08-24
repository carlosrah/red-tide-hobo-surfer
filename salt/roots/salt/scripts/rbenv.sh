#!/bin/bash
echo 'export RBENV_ROOT=/usr/local/rbenv' >> ~/.profile
echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(rbenv init -)"' >> ~/.profile
