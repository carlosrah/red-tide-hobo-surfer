# Red Tide Hobo Surfer

This is a Vagrant/SaltStack configuration to build disposable Ruby development
environments with a MySQL database option.

While this was built with Rails and Sinatra in mind, there is nothing preventing
the user from using this for any Ruby specific project where they want an
isolated development environment with a MySQL database.

## Requirements

This Vagrant build expects that you have the
[Salty-Vagrant plugin](https://github.com/saltstack/salty-vagrant) installed.

## What's Happening

The current configurations creates a Vagrant development environment with Ubuntu
12.04 LTS, build tools, Git, Vim, OpenSSL, Curl, the most current Ruby
(2.0.0-p247) through rbenv, the most current version of NodeJS, MySQL and the
Bundler gem.

When Vagrant instance is running `cd` to `/vagrant` and all typical Railsy commands
(`$ bundle update`, `$ rails server`, etc) should perform as expected.

## Basic Usage

Clone _Red Tide Hobo Surfer_ into your development directory and run the
following commands:

```bash
$ vagrant up
$ vagrant ssh
$ sudo salt-call state.highstate
$ . /vagrant/salt/post-install/ruby-install.sh
```

## Detailed Usage

### Greenfield

Clone _Red Tide Hobo Surfer_ into your future project and remove the .git
directory. You could submodule this project, but my experience with git
submodules is mixed.

### Currently Working Project

Clone _Red Tide Hobo Surfer_ into a new directory and then move the
`Vagrantfile` and the `salt/` directory into your working project directory.

```bash
$ mv Vagrantfile /your/project/path
$ mv salt/ /your/project/path
```

## Using with Rails

_Red Tide Hobo Surfer_ provides a completely isolated development environment
for your Rails project. What this means is that when you first run through the
build process you must run Bundler and then create your database while ssh'ed
into your Vagrant build (the guest machine). This is great because it takes away
the challenges of getting a MySQL database running on your local system. It does
take a little getting used to, though.

### Basic Rails Commands

Assuming you're sharing your `vagrant/` directory (as is the standard) and this
is where you have your Rails app living on your host machine you can do the
following once the build is initially completed run:

```bash
$ cd /vagrant
$ bundle
# create the db
$ rake db:create
# start up your Rails server
$ bundle exec rails s
```

You'll now be able to run http://localhost:3000 and your index route will be
visible.

### A Note on Changes

As usual, any changes you make to your `Gemfile` will require you to run `$
bundle` from the guest machine. You'll also likely need to restart your Rails
server on the guest machine.

## Connecting to MySQL using a GUI

Vagrant allows you to connect to the running MySQL database through SSH. This
means that if you want to connect using something like [Sequel
Pro](http://www.sequelpro.com/) you can.

_Red Tide Hobo Surfer_ has a no password build for the root user for MySQL host
127.0.0.1.  To connect to the running database use the user `vagrant` and the
ssh key found in `~/.vagrant.d/insecure_private_key` on port 2222.

## References / Thank Yous

Major parts of this has been taken from the excellent RailsCast #292 [Virtual
Machines with Vagrant](http://railscasts.com/episodes/292-virtual-machines-with-vagrant), help
from the [SaltStack IRC channel #salt](http://docs.saltstack.com/topics/community.html#irc) and help from
[Demian Ginther](https://github.com/dginther).
