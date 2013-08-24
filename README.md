# Red Tide Hobo Surfer

This is a Vagrant/SaltStack configuration to build disposable Ruby development
environments with a MySQL database option.

While this was built with Rails and Sinatra in mind, there is nothing preventing
the user from using this for any Ruby specific project where they want an
isolated development environment with a MySQL database.

## Requirements

This Vagrant build expects that you have the
[Salty-Vagrant plugin](https://github.com/saltstack/salty-vagrant) installed.

## Usage

Clone this repo into your development directory and run the following:

```bash
$ vagrant up
$ vagrant ssh
$ sudo salt-call state.highstate
$ . /vagrant/salt/post-install/ruby-install.sh
```

## What's Happening

The current configurations creates a Vagrant development environment with Ubuntu
12.04 LTS, build tools, Git, Vim, OpenSSL, Curl, the most current Ruby
(2.0.0-p247) through rbenv, most current version of NodeJS, MySQL and the
Bundler gem.

When Vagrant instance is running `cd` to `/vagrant` and all typical Railsy commands
(`$ bundle update`, `$ rails server`, etc) should perform as expected.

## References / Thank Yous

Major parts of this has been taken from the excellent RailsCast #292 [Virtual
Machines with Vagrant](http://railscasts.com/episodes/292-virtual-machines-with-vagrant), help
from the [SaltStack IRC channel #salt](http://docs.saltstack.com/topics/community.html#irc) and help from
[Demian Ginther](https://github.com/dginther).
