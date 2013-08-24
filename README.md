# Salty-Rails

This Vagrant/SaltStack configuration is my attempt to automate a basic Ruby,
Rails-friendly, environment with a MySQL database. 

While this was built with Rails in mind, there is nothing preventing the user
from using this for any Ruby specific project where they want an isolated
development environment with a MySQL database. 

In other words, there is nothing Rails specific with this environment.

## Requirements

This Vagrant build expects that you have the
[Salty-Vagrant plugin](https://github.com/saltstack/salty-vagrant) installed.

## Usage

Clone this repo into your Rails application directory and run the following:

```bash
$ vagrant up
$ vagrant ssh
$ sudo salt-call state.highstate
$ . /vagrant/post-salt-install/rbenv.sh
```

## What's Happening

The current configurations creates a Vagrant development environment with Ubuntu
12.04 LTS, build tools, Git, Vim, OpenSSL, Curl, the most current Ruby
(2.0.0-p247) through rbenv, MySQL and the Bundler gem.

When Vagrant instance is running `cd` to `/vagrant` and all typical Railsy commands
(`$ bundle update`, `$ rails server`, etc) should perform as expected.

## References / Thank Yous

Major parts of this has been taken from the excellent RailsCast #292 [Virtual
Machines with Vagrant](http://railscasts.com/episodes/292-virtual-machines-with-vagrant), help
from the [SaltStack IRC channel #salt](http://docs.saltstack.com/topics/community.html#irc) and help from
[Demian Ginther](https://github.com/dginther).
